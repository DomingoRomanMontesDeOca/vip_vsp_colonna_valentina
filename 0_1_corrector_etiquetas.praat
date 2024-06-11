# Corrige etiquetas (elimina espacios en blanco iniciales y finales)
# en los tiers 1, 2 3 y 4


# inicio de contadores

contador_espacios_iniciales = 0

contador_espacios_finales = 0


tg = selected("TextGrid")

ene_intervalos_1 = Get number of intervals: 1

ene_intervalos_2 = Get number of intervals: 2

ene_intervalos_3 = Get number of intervals: 3

ene_intervalos_4 = Get number of intervals: 4

writeInfoLine: "======"
appendInfoLine: " R E P O R T E "

for i to ene_intervalos_1

	etiqueta_1$ = Get label of interval: 1, i

	primer_caracter_1$ = left$(etiqueta_1$, 1)

	ultimo_caracte_1$ = right$(etiqueta_1$, 1)


	if startsWith(etiqueta_1$, " ")

		largo = length(etiqueta_1$)

		appendInfoLine: i, tab$, largo

		nueva_etiqueta_1$ = right$(etiqueta_1$, largo-1)

		appendInfoLine: etiqueta_1$

		appendInfoLine: nueva_etiqueta_1$

		Set interval text: 1, i, nueva_etiqueta_1$

		contador_espacios_iniciales = contador_espacios_iniciales + 1
	
	endif


	if endsWith(etiqueta_1$, " ")

		largo = length(etiqueta_1$)

		appendInfoLine: i, tab$, largo

		nueva_etiqueta_1$ = left$(etiqueta_1$, largo-1)

		appendInfoLine: etiqueta_1$

		appendInfoLine: nueva_etiqueta_1$

		Set interval text: 1, i, nueva_etiqueta_1$

		contador_espacios_finales = contador_espacios_finales + 1
	
	endif

endfor



for i to ene_intervalos_2

	etiqueta_2$ = Get label of interval: 2, i

	primer_caracter_2$ = left$(etiqueta_2$, 1)

	ultimo_caracter_2$ = right$(etiqueta_2$, 1)


	if startsWith(etiqueta_2$, " ")

		largo = length(etiqueta_2$)

		appendInfoLine: i, tab$, largo

		nueva_etiqueta_2$ = right$(etiqueta_2$, largo-1)

		appendInfoLine: etiqueta_2$

		appendInfoLine: nueva_etiqueta_2$

		Set interval text: 2, i, nueva_etiqueta_2$

		contador_espacios_iniciales = contador_espacios_iniciales + 1
	
	endif


	if endsWith(etiqueta_2$, " ")

		largo = length(etiqueta_2$)

		appendInfoLine: i, tab$, largo

		nueva_etiqueta_2$ = left$(etiqueta_2$, largo-1)

		appendInfoLine: etiqueta_2$

		appendInfoLine: nueva_etiqueta_2$

		Set interval text: 2, i, nueva_etiqueta_2$

		contador_espacios_finales = contador_espacios_finales + 1
	
	endif

endfor






for i to ene_intervalos_3

	etiqueta_3$ = Get label of interval: 3, i

	primer_caracter_3$ = left$(etiqueta_3$, 1)

	ultimo_caracter_3$ = right$(etiqueta_3$, 1)


	if startsWith(etiqueta_3$, " ")

		largo = length(etiqueta_3$)

		appendInfoLine: i, tab$, largo

		nueva_etiqueta_3$ = right$(etiqueta_3$, largo-1)

		appendInfoLine: etiqueta_3$

		appendInfoLine: nueva_etiqueta_3$

		Set interval text: 3, i, nueva_etiqueta_3$

		contador_espacios_iniciales = contador_espacios_inciales + 1
	
	endif


	if endsWith(etiqueta_3$, " ")

		largo = length(etiqueta_3$)

		appendInfoLine: i, tab$, largo

		nueva_etiqueta_3$ = left$(etiqueta_3$, largo-1)

		appendInfoLine: etiqueta_3$

		appendInfoLine: nueva_etiqueta_3$

		Set interval text: 3, i, nueva_etiqueta_3$

		contador_espacios_finales = contador_espacios_finales + 1
	
	endif

endfor


for i to ene_intervalos_4

	etiqueta_4$ = Get label of interval: 4, i

	primer_caracter_4$ = left$(etiqueta_4$, 1)

	ultimo_caracter_4$ = right$(etiqueta_4$, 1)


	if startsWith(etiqueta_4$, " ")

		largo = length(etiqueta_4$)

		appendInfoLine: i, tab$, largo

		nueva_etiqueta_4$ = right$(etiqueta_4$, largo-1)

		appendInfoLine: etiqueta_4$

		appendInfoLine: nueva_etiqueta_4$

		Set interval text: 4, i, nueva_etiqueta_4$

		contador_espacios_iniciales = contador_espacios_iniciales + 1
	
	endif


	if endsWith(etiqueta_4$, " ")

		largo = length(etiqueta_4$)

		appendInfoLine: i, tab$, largo

		nueva_etiqueta$ = left$(etiqueta_4$, largo-1)

		appendInfoLine: etiqueta_4$

		appendInfoLine: nueva_etiqueta_4$

		Set interval text: 4, i, nueva_etiqueta_4$

		contador_espacios_finales = contador_espacios_finales + 1
	
	endif

endfor

appendInfoLine: "Sustituciones de espacios iniciales: " + fixed$(contador_espacios_iniciales, 0)
appendInfoLine: "Sustituciones de espacios finales: " + fixed$(contador_espacios_finales, 0)
