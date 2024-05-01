# el script puede fallar por etiquetas mal puestas de pausas en tier 2
# 
# ejemplo:
# 	nombre de audio : Mora0fGranLorca1Es2023
# 		Mora (apellido lector)
# 		0 (diferenciador de apellido)
# 		f (sexo)
# 		Gran(ciudad)
# 		Lorca (autor)
# 		1 (número de poema del autor)
# 		Es (lengua)
# 		2023 (año de la grabación)
# @valentinacolonna

# se supone que el textGrid tiene 7 tiers


# Verficar que sean tres los objetos seleccionados, 

ene_objetos_seleccionados = numberOfSelected()

if ene_objetos_seleccionados <> 3

	appendInfoLine: "No tienes tres objetos seleccionados"

else
	tg = selected("TextGrid")
	tg$ = selected$("TextGrid")
	sn = selected("Sound")
	sn$ = selected$("Sound")
	tono = selected("Pitch")
	tono$ = selected$("Pitch")

endif

ene_sonidos_seleccionados = numberOfSelected("Sound")
ene_etiquet_seleccionados = numberOfSelected("TextGrid")
ene_tonos_seleccionados = numberOfSelected("Pitch")

if ene_sonidos_seleccionados <> 1 or ene_etiquet_seleccionados <> 1 or ene_tonos_seleccionados <> 1
	appendInfoLine: "Falta un objeto en la selección"
endif


writeInfoLine: "=====0====="

if tg$ <> sn$ or sn$ <> tono$ or tono$ <> tg$
	appendInfoLine: "Revise que sean los archivos que corresponde"
endif



# verificar que todos los objetos tengan la misma longitud





# variables para datos de las primeras columnas: lector, autor, poema, etc.

apellido_lector$ = left$(sn$, 4)

# Diferenciador de apellido en caso de que haya más de uno con el mismo apellido

diferen_apellido$ = mid$(sn$, 5, 1)
sexo$ = mid$(sn$, 6,1)
ciudad$ = mid$(sn$, 7, 3)
autor$ = mid$(sn$,11,4)
n_poema$ = mid$(sn$,15,1) 
lengua$ =mid$(sn$,16,2)
ano_grabacion$ = mid$(sn$,18,4)



# crea objeto de intensidad

select sn

intensidad =  To Intensity: 100, 0, "yes"


writeInfoLine: "==========00=========="


# El tier 2 es "CP" o curva prosódica



# inicia contador de intervalos sin considerar las pausa

contador_de_intervalos_sin_pausa = 0


select tg
ene_intervalos_tier_2 = Get number of intervals: 2
ene_intervalos_tier_4 = Get number of intervals: 4


for i to ene_intervalos_tier_2

	etiqueta$ = Get label of interval: 2, i

	if etiqueta$ <> "<pl>" and etiqueta$ <> "<pb>" and etiqueta$ <> "<pm>" and etiqueta$ <> "<pll>" and etiqueta$ <> "<P>" and etiqueta$ <> "" and etiqueta$ <> "  "


# 	suma 1 cada vez que corresponda al contador de intervalos excluyendo las pausas
		
	contador_de_intervalos_sin_pausa = contador_de_intervalos_sin_pausa + 1

	endif

endfor


# En este punto, el contador de intervalos —sin contar las pausas— está completo


# crea la tabla con los datos

tabla_por_curva = Create Table with column names: "table", contador_de_intervalos_sin_pausa, { "apellido_lector", "diferen_apellido", "sexo", "ciudad", "autor", "n_poema", "lengua", "ano_grabacion","n_cp","texto", "n_silabas", "verso-curva", "duracion", "n_pr", "st", "x_hz", "dif_max_min_db", "x_db", "interrup", "sinonim", "declarat_poet", "focus", "encabalga" }


# agrega el número correlativo del verso-curva en la tabla

for i to contador_de_intervalos_sin_pausa

	select tabla_por_curva

	Set numeric value: i, "n_cp", i

endfor



select tg


# contador_etiquetas es el número de intervalos no vacíos, excluyendo las pausas
# esta parte del código agrega el texto de la curva prosódica


contador_etiquetas = 0

for i to ene_intervalos_tier_2

	select tg

	etiqueta2$ = Get label of interval: 2, i

	ini = Get start time of interval: 2, i

	fin = Get end time of interval: 2, i

	dur = fin-ini

# Trabaja con un extracto del TextGrid
#	selecto = Extract part: ini, fin, "no"

	selecto = Extract part: ini, fin, "yes"

	ene_pr = Get number of intervals: 1

	ene_puntos_tier_6 = Get number of points: 6


	if ene_puntos_tier_6 > 0

		ene_de_silabas_tiempo = Get time of point: 6, 1

		ene_silabas$ = Get label of point: 6, 1

		ene_silabas = number(ene_silabas$)

	endif



	ene_puntos_tier_5 = Get number of points: 5



	if ene_puntos_tier_5 == 3

		tiempo_intens_A =  Get time of point: 5, 1

		tiempo_intens_B	=  Get time of point: 5, 2

		tiempo_intens_C =  Get time of point: 5, 3

		select intensidad

		db_A = Get value at time: tiempo_intens_A, "cubic"
		db_B = Get value at time: tiempo_intens_B, "cubic"
		db_C = Get value at time: tiempo_intens_C, "cubic"

		x_db = (db_A + db_B + db_C)/3

		if db_A > db_B and db_A > db_C
			max_db = db_A
				if db_B < db_C
					min_db = db_B
				else
					min_db = db_C

				endif
		elsif db_B > db_A and db_B > db_C
			max_db = db_B
				if db_A < db_C
					min_db = db_A
				else
					min_db = db_C
				endif
		
		elsif db_C > db_A and db_C > db_B
			max_db = db_C
				if db_A < db_B
					min_db = db_A
				else
					min_db = db_B
				endif
		endif

		dif_max_min_db = max_db - min_db
		
	else
		
		dif_max_min_db = 1

	endif


	select tono

	x_f0 = Get mean: ini, fin, "Hertz"

	max_f0 =  Get maximum: ini, fin, "Hertz", "parabolic"

	min_f0 = Get minimum: ini, fin, "Hertz", "parabolic"

	st_max_min = 12*log2(max_f0/min_f0)




	if etiqueta2$ <> "<pl>" and etiqueta2$ <> "<pb>" and etiqueta2$ <> "<pm>" and etiqueta2$ <> "<pll>" and etiqueta2$ <> "<P>" and etiqueta2$ <> ""

		contador_etiquetas = contador_etiquetas + 1

		select tabla_por_curva

		Set string value: contador_etiquetas, "texto", etiqueta2$

		Set string value: contador_etiquetas, "apellido_lector", apellido_lector$

		Set string value: contador_etiquetas, "diferen_apellido",diferen_apellido$

		Set string value: contador_etiquetas, "sexo", sexo$

		Set string value: contador_etiquetas, "ciudad", ciudad$

		Set string value: contador_etiquetas, "autor", autor$

		Set string value: contador_etiquetas, "n_poema", n_poema$

		Set string value: contador_etiquetas, "lengua", lengua$

		Set string value: contador_etiquetas, "ano_grabacion", ano_grabacion$

		Set numeric value: contador_etiquetas, "duracion", dur

		Set numeric value: contador_etiquetas, "x_hz", x_f0

		Set numeric value: contador_etiquetas, "st", st_max_min

		Set numeric value: contador_etiquetas, "n_pr", ene_pr

		Set numeric value: contador_etiquetas, "n_silabas", ene_silabas

		Set numeric value: contador_etiquetas, "dif_max_min_db", dif_max_min_db

		Set numeric value: contador_etiquetas, "x_db", x_db	



	endif

	select selecto
	Remove

endfor

select tabla_por_curva

Append quotient column: "n_silabas", "duracion", "vel_elocucion"


# ====================

select tg

# Recorre todos los intervalos del tier 2 (CP)


tabla_provisoria = Create Table with column names: "provisoria", 19, { "a", "b", "c" }

contador_casos = 0

for i to ene_intervalos_tier_2

	select tg

	etiqueta2$ = Get label of interval: 2, i

	if etiqueta2$ <> "" and etiqueta2$ <> "<P>" and etiqueta2$ <> "<pl>" and etiqueta2$ <> "<pb>"

		ini_intervalo_tier_2 = Get start time of interval: 2, i

		fin_intervalo_tier_2 = Get end time of interval: 2, i

		intervalo_alto_tier_4_tiempo_iniT2 = Get high interval at time: 4, ini_intervalo_tier_2

		intervalo_alto_tier_4_tiempo_finT2 = Get high interval at time: 4, fin_intervalo_tier_2
		
		#appendInfoLine: i, tab$, intervalo_alto_tier_4_tiempo_iniT2,tab$, intervalo_alto_tier_4_tiempo_finT2

		contador_casos = contador_casos + 1

		#appendInfoLine: contador_casos

		select tabla_provisoria

		Set numeric value: contador_casos, "a", intervalo_alto_tier_4_tiempo_iniT2

		Set numeric value: contador_casos, "b", intervalo_alto_tier_4_tiempo_finT2

	endif



endfor

select tabla_provisoria

n_filas_tabla_provisoria = Get number of rows

for i to n_filas_tabla_provisoria-1

		a = Get value: i, "a"

		a2 = Get value: i+1, "a"

		if a == a2

			valor_c = 1

		else
			valor_c = 0

		endif

		select tabla_provisoria

		Set numeric value: i, "c", valor_c

endfor






select tabla_provisoria

n_filas_tabla_provisoria = Get number of rows

for i to n_filas_tabla_provisoria-1

		dd = Get value: i, "a"

		dd2 = Get value: i+1, "a"

		ee = Get value: i, "b"

		ff = Get value: i, "c"

		if ff == 1

			if dd2 == dd

				select tabla_provisoria

				Set numeric value: i+1, "c", 1

			endif

		endif

endfor


select tabla_provisoria

ultimo_valor = Get value: n_filas_tabla_provisoria, "a"

penultimo_valor = Get value: n_filas_tabla_provisoria-1, "a"

if ultimo_valor == penultimo_valor

	valor_c = 1
else
	valor_c = 0

endif

Set numeric value: n_filas_tabla_provisoria, "c", valor_c


# Agrega el valor de verso-curva en la columna señalada
# Indica 0 si coincide el intervalo del tier 2 con el del tier 4
# Si coincide, verso-curva = 0
# Si no coincide, verso-curva = 1

select tabla_por_curva

n_filas_tabla_por_curva = Get number of rows

# Se comprueba que las dos tablas tengan el mísmo número de filas

if n_filas_tabla_por_curva <> n_filas_tabla_provisoria

	writeInfoLine: "Alerta, cuore, diferencia en número de filas en ambas tablas"

endif


# se agrega el valor "0" o "1" en la columna verso-curva

for i to n_filas_tabla_por_curva

	select tabla_provisoria

	vc = Get value: i, "c"

	select tabla_por_curva

	Set numeric value: i, "verso-curva", vc

endfor

select intensidad
plus tabla_provisoria
Remove
