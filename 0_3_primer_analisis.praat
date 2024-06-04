# Versión infinita

# el script puede fallar por etiquetas mal puestas de pausas en tier 2

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

# se supone un TextGrid de 10 capas

# Verifica que sean tres los objetos seleccionados


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



if tg$ <> sn$ or sn$ <> tono$ or tono$ <> tg$

	appendInfoLine: "Revise que sean los archivos que corresponde"

endif



# verificar que el nombre de cada objeto coincida con los otros correspondientes (tengan la misma longitud sin contar la extensión)

# cuenta intervalos en tiers 2 y 4

select tg

ene_intervalos_tier_2 = Get number of intervals: 2

ene_intervalos_tier_4 = Get number of intervals: 4


writeInfoLine: "Comienza análisis de ", sn$ 


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

# inicia contador de intervalos sin considerar las pausa

# Esto es importante para crear una tabla con el número de filas que corresponden a curvas prosódicas

# y no considerar los intervalos no etiquetados ni los etiquetados con pausas, como "<P>" u otro.

contador_de_intervalos_sin_pausa = 0

select tg

for i to ene_intervalos_tier_2

	etiqueta$ = Get label of interval: 2, i

	if etiqueta$ <> "<pl>" and etiqueta$ <> "<pb>" and etiqueta$ <> "<pm>" and etiqueta$ <> "<pll>" and etiqueta$ <> "<P>" and etiqueta$ <> "" and etiqueta$ <> "  "

# 	suma 1 cada vez que corresponda al contador de intervalos excluyendo las pausas
		
	contador_de_intervalos_sin_pausa = contador_de_intervalos_sin_pausa + 1

	endif

endfor


# En este punto, el contador de intervalos —sin contar las pausas— está completo

# crea la tabla para disponer los datos por curva prosódica. El contador_de_intervalos_sin_pausa es el número de curvas prosódicas de la recitación

tabla_por_curva = Create Table with column names: "table", contador_de_intervalos_sin_pausa, { "apellido_lector", "diferen_apellido", "sexo", "ciudad", "autor", "n_poema", "lengua", "ano_grabacion","n_cp","n_intervalo","n_verso","hemiverso","texto", "n_silabas", "verso-curva", "duracion", "n_pr", "st", "x_hz", "dif_max_min_db", "x_db", "interrup", "sinonimia", "declarat_poet", "focus1","focus2","focus3", "encabalga" }


# agrega un número correlativo del verso-curva en la tabla

for i to contador_de_intervalos_sin_pausa

	select tabla_por_curva

	Set numeric value: i, "n_cp", i

endfor





# contador_etiquetas es el número de intervalos no vacíos, excluyendo las pausas

# esta parte del código agrega el texto de la curva prosódica

select tg

# Revisar funcionalidad de esta variable.

# es posible que repita el valor de contador_de_intervalos_sin_pausa

###################
contador_etiquetas = 0
###################

for i to ene_intervalos_tier_2

	select tg

	etiqueta2$ = Get label of interval: 2, i

	ini = Get start time of interval: 2, i

	fin = Get end time of interval: 2, i

	dur = fin-ini


# Trabaja con un extracto del TextGrid

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


	if etiqueta2$ <> "<pl>" and etiqueta2$ <> "<pb>" and etiqueta2$ <> "<pm>" and etiqueta2$ <> "<pll>" and etiqueta2$ <> "<P>" and etiqueta2$ <> "" and etiqueta2$ <> " "

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

		Set numeric value: contador_etiquetas, "n_intervalo", i

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


appendInfoLine: "La tabla con los datos del archivo está completa"


# Agrega la columna con la velocidad de elocución que divide n_silabas/duracion

select tabla_por_curva

Append quotient column: "n_silabas", "duracion", "vel_elocucion"


appendInfoLine: "Velocidad de elocución inserta en la tabla"

select tg

# Recorre todos los intervalos del tier 2 (CP)


tabla_provisoria = Create Table with column names: "provisoria", contador_de_intervalos_sin_pausa, { "a", "b", "c" }

contador_casos = 0

for i to ene_intervalos_tier_2

	select tg

	etiqueta2$ = Get label of interval: 2, i

	if etiqueta2$ <> "" and etiqueta2$ <> "<P>" and etiqueta2$ <> "<pl>" and etiqueta2$ <> "<pb>" and etiqueta2$ <> " "

		ini_intervalo_tier_2 = Get start time of interval: 2, i

		fin_intervalo_tier_2 = Get end time of interval: 2, i

		intervalo_alto_tier_4_tiempo_iniT2 = Get high interval at time: 4, ini_intervalo_tier_2

		intervalo_alto_tier_4_tiempo_finT2 = Get high interval at time: 4, fin_intervalo_tier_2
		
		contador_casos = contador_casos + 1

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

			valor_c = 0

		else
			valor_c = 1

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

		if ff == 0

			if dd2 == dd

				select tabla_provisoria

				Set numeric value: i+1, "c", 0

			endif

		endif

endfor


select tabla_provisoria

ultimo_valor = Get value: n_filas_tabla_provisoria, "a"

penultimo_valor = Get value: n_filas_tabla_provisoria-1, "a"

if ultimo_valor == penultimo_valor

	valor_c = 0
else
	valor_c = 1

endif

Set numeric value: n_filas_tabla_provisoria, "c", valor_c


# Agrega el valor de verso-curva en la columna señalada

# Indica 0 si coincide el intervalo del tier 2 con el del tier 4

# Si coincide, verso-curva = 1

# Si no coincide, verso-curva = 0

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

appendInfoLine: "Se ha realizado el análisis de verso-curva"



########### hemiversos #############


tabla_para_hemiversos =Create Table with column names: "table", contador_de_intervalos_sin_pausa, { "cp", "vs", "hvs" }


for i to n_filas_tabla_por_curva

	select tabla_por_curva

	intervalo = Get value: i, "n_intervalo"

	# se tiene el número del intervalo en el TextGrid

	select tg

	tiempo_ini_cp = Get start time of interval: 2, intervalo

	tiempo_fin_cp = Get end time of interval: 2, intervalo

	intervalo_tiempo_ini_cp = Get interval at time: 4, tiempo_ini_cp

	select tabla_para_hemiversos

	Set numeric value: i, "cp", i

	Set numeric value: i, "vs", intervalo_tiempo_ini_cp

	
endfor


select tabla_para_hemiversos

ene_filas = Get number of rows


for i to ene_filas-1

	select tabla_para_hemiversos

	valor = Get value: i, "vs"

	valor2 = Get value: i + 1, "vs"

	sigue = i + 1

	if valor == valor2

		hemi = 1

		Set numeric value: i, "hvs", hemi

		Set numeric value: i+1, "hvs", hemi

	else

		hemi = 0

		Set numeric value: i, "hvs", hemi

	endif

endfor






for i to ene_filas-1

	valor1 = Get value: i, "vs"

	valor2 = Get value: i + 1, "vs"

	if valor1 == valor2
		
		Set numeric value: i+1, "hvs", 1

	endif

endfor


# resolver última línea

valor_penultimo_vs = Get value: ene_filas-1, "vs"

valor_final_vs = Get value: ene_filas, "vs"



if valor_penultimo_vs == valor_final_vs
	
	Set numeric value: ene_filas, "hvs", 1

	Set numeric value: ene_filas-1, "hvs", 1

else

	Set numeric value: ene_filas, "hvs", 0


endif

select tabla_para_hemiversos

ene_filas_hemiverso = Get number of rows


select tabla_por_curva

ene_filas_curvas = Get number of rows


if ene_filas_hemiverso <> ene_filas_curvas

	appendInfoLine: "No coincide número de filas"

endif 

#### Pasa valores a tabla general


select tabla_para_hemiversos

for i to ene_filas

	select tabla_para_hemiversos

	n_verso = Get value: i, "vs"

	valor_hemi =  Get value: i, "hvs"

	select tabla_por_curva

	Set numeric value: i, "n_verso", n_verso

	Set numeric value: i, "hemiverso", valor_hemi

endfor


select tabla_para_hemiversos

Remove

appendInfoLine: "Se ha realizado el análisis de hemiversos"


######################################################################
# Análisis de Interrupt
######################################################################
select tabla_por_curva

nfilas = Get number of rows

select tg

for i to nfilas

	select tg

	# tiempo de inicio y de fin

	ini_intervalo = Get start time of interval: 2, i

	fin_intervalo = Get end time of interval: 2, i

	# extrae fragmento del TextGrid

	fragmento_tier_7 = Extract part: ini_intervalo, fin_intervalo, "no"

	interruptus = Get number of points: 7

	select tabla_por_curva

	Set numeric value: i, "interrup", interruptus

	select fragmento_tier_7

	Remove

endfor
appendInfoLine: "Se ha realizado el análisis de interrupts"
######################################################################
# Análisis de Focus
######################################################################


select tabla_por_curva

nfilas = Get number of rows

for i to nfilas

	select tabla_por_curva 

	ene_de_intervalo_cp = Get value: i, "n_intervalo"

	select tg

	ini_intervalo = Get start time of interval: 2, ene_de_intervalo_cp

	fin_intervalo = Get end time of interval: 2, ene_de_intervalo_cp

	fragmento_tg = Extract part: ini_intervalo, fin_intervalo, "yes"	

	focus = Get number of points: 10
	
	if focus == 3

		tiempo_focus_1 = Get time of point: 10, 1

		tiempo_focus_2 = Get time of point: 10, 2

		tiempo_focus_3 = Get time of point: 10, 3

		select tono

		f0_focus_1 = Get value at time: tiempo_focus_1, "Hertz", "linear"

		f0_focus_2 = Get value at time: tiempo_focus_2, "Hertz", "linear"

		f0_focus_3 = Get value at time: tiempo_focus_3, "Hertz", "linear"

	else

		f0_focus_1 = 0

		f0_focus_2 = 0

		f0_focus_3 = 0

	endif	

	
		select 	tabla_por_curva

		Set numeric value: i, "focus1", f0_focus_1

		Set numeric value: i, "focus2", f0_focus_2

		Set numeric value: i, "focus3", f0_focus_3

		select fragmento_tg

		Remove

endfor

appendInfoLine: "Se ha realizado el análisis de focus"



######################################################################
# Análisis de sinonimia
######################################################################


select tabla_por_curva

nfilas = Get number of rows

for i to nfilas

	select tabla_por_curva 

	ene_de_intervalo_cp = Get value: i, "n_intervalo"

	select tg

	ini_intervalo = Get start time of interval: 2, ene_de_intervalo_cp

	fin_intervalo = Get end time of interval: 2, ene_de_intervalo_cp

	fragmento_tg = Extract part: ini_intervalo, fin_intervalo, "no"	

	sinonim = Get number of points: 8

	if sinonim > 0
	
		if sinonim == 1

		tpo_etiqueta_sinomimia$ = Get time of point: 8, 1

		etiqueta_sinonimia$ = Get label of point: 8, 1
	
		elif sinonim > 1

		etiqueta_sinonimia$ = "Más de 1"

		endif

	else

		etiqueta_sinonimia$ = "0"

		
	endif	

	
		select 	tabla_por_curva

		Set string value: i, "sinonimia", etiqueta_sinonimia$

		select fragmento_tg

		Remove

endfor

appendInfoLine: "Se ha realizado el análisis de sinonimia"

appendInfoLine: "Se ha realizado el análisis completo"
