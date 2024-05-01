# Este script agrega el tier de intensidad
# después de aplicar, hay que ajustar los puntos A, B y C
# que aparecen en el tier 5 ("Intensidad")
# en función de la vocal inicial, una vocal media y la vocal final
# o tres puntos en caso de que no haya tres vocales en la selección

# agrega el tier de número de sílabas

# agrega un tier para la interrupt


## falta corregir etiqueta "<" y nada más
## líneas sobrantes

tg = selected("TextGrid")

ene_tiers = Get number of tiers

if ene_tiers == 4

	Insert point tier: 5, "Intensidad"

	Insert point tier: 6, "Nsilabas"

	Insert point tier: 7, "Interrupt"

	ene_intervalos_tier_2 = Get number of intervals: 2

	for i to ene_intervalos_tier_2

		etiqueta$ = Get label of interval: 2, i

		if etiqueta$ <> "<pl>" and etiqueta$ <> "<pb>" and etiqueta$ <> "<pm>" and etiqueta$ <> "<pll>" and etiqueta$ <> "<P>" and etiqueta$ <> ""

			etiqueta2$ = Get label of interval: 2, i

			ini = Get start time of interval: 2, i

			fin = Get end time of interval: 2, i

			dur = fin-ini

			distancia_puntos_intensidad = dur/4

			Insert point: 5, ini+distancia_puntos_intensidad, "A"

			Insert point: 5, ini+(distancia_puntos_intensidad*2), "B"

			Insert point: 5, ini+(distancia_puntos_intensidad*3), "C"

			Insert point: 6, ini+(distancia_puntos_intensidad*2), ""

		endif

	endfor

else
	appendInfoLine: "TextGrid con ", ene_tiers, " tiers."
endif
