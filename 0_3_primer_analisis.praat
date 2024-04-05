# el script puede fallar por etiquetas mal puestas de pausas en tier 2
# falta el definitivo código del nombre para extraer variables a partir de él.


tg = selected("TextGrid")
sn = selected("Sound")
sn$ = selected$("Sound")
tono = selected("Pitch")

# crea objeto de intensidad


select sn

intensidad =  To Intensity: 100, 0, "yes"


writeInfoLine: "==========00=========="


# El tier 2 es "CP" o curva prosódica



# inicia contador de intervalos sin considerar las pausa

contador_de_intervalos_sin_pausa = 0


select tg
ene_intervalos_tier_2 = Get number of intervals: 2

for i to ene_intervalos_tier_2

	etiqueta$ = Get label of interval: 2, i

	if etiqueta$ <> "<pl>" and etiqueta$ <> "<pb>" and etiqueta$ <> "<pm>" and etiqueta$ <> "<pll>" and etiqueta$ <> "<P>" and etiqueta$ <> "" and etiqueta$ <> "  "


# 	suma 1 cada vez que corresponda al contador de intervalos excluyendo las pausas
		
	contador_de_intervalos_sin_pausa = contador_de_intervalos_sin_pausa + 1

	endif

endfor


# En este punto, el contador de intervalos —sin contar las pausas— está completo


# crea la tabla con los datos

tabla_por_curva = Create Table with column names: "table", contador_de_intervalos_sin_pausa, { "n_cp","texto", "n_silabas", "verso-curva", "duracion", "n_pr", "st", "x_hz", "dif_max_min_db", "x_db", "interrup", "sinonim", "declarat_poet", "focus", "encabalga" }


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
