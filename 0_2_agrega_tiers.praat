# Este script funciona solo con aquellos TextGrid de 4 tiers



directorio$ = chooseDirectory$ ("Elija directorio con archivos")

strings1 = Create Strings as file list... lista_1 'directorio$'/*.TextGrid



ene_archivos = Get number of strings

writeInfoLine: "======"

for i to ene_archivos

	select strings1

	textg$ = Get string... i

	tg = Read from file... 'directorio$'/'textg$'

	ene_tiers = Get number of tiers

	if ene_tiers == 4

		Insert point tier: 5, "INT"

		Insert point tier: 6, "Nsil"

		Insert point tier: 7, "INTERR"

		Insert point tier: 8, "SIN"

		Insert point tier: 9, "DECLA"

		Insert point tier: 10, "FOC"

		ene_intervalos_tier_2 = Get number of intervals: 2

		for i_inter to ene_intervalos_tier_2

			etiqueta$ = Get label of interval: 2, i_inter

			if etiqueta$ <> "<pl>" and etiqueta$ <> "<pb>" and etiqueta$ <> "<pm>" and etiqueta$ <> "<pll>" and etiqueta$ <> "<P>" and etiqueta$ <> ""

				etiqueta2$ = Get label of interval: 2, i_inter

				ini = Get start time of interval: 2, i_inter

				fin = Get end time of interval: 2, i_inter

				dur = fin-ini

				distancia_puntos_intensidad = dur/4

				Insert point: 5, ini+distancia_puntos_intensidad, "A"

				Insert point: 5, ini+(distancia_puntos_intensidad*2), "B"

				Insert point: 5, ini+(distancia_puntos_intensidad*3), "C"

				Insert point: 6, ini+(distancia_puntos_intensidad*2), ""

			endif

		endfor

	endif

endfor
