# Corrige etiquetas (elimina espacios en blanco iniciales y finales)
# en los tiers 1, 2, 3 y 4


# inicio de contadores

contador_espacios_iniciales = 0

contador_espacios_finales = 0




directorio$ = chooseDirectory$ ("Elija directorio con archivos")

strings1 = Create Strings as file list... lista_1 'directorio$'/*.TextGrid

# la extensión puede ser otra, ciertamente

ene_archivos = Get number of strings

writeInfoLine: "======"


appendInfoLine: " R E P O R T E "

for i to ene_archivos

	select strings1

	textg$ = Get string... i



	tg = Read from file... 'directorio$'/'textg$'


	ene_tiers = Get number of tiers

	if ene_tiers <> 4

		appendInfoLine: textg$, " tiene ", fixed$(ene_tiers,0), " tiers"

	endif


	ene_intervalos_1 = Get number of intervals: 1

	ene_intervalos_2 = Get number of intervals: 2

	ene_intervalos_3 = Get number of intervals: 3

	ene_intervalos_4 = Get number of intervals: 4


	for i_inter to ene_intervalos_1

		etiqueta_1$ = Get label of interval: 1, i_inter

		primer_caracter_1$ = left$(etiqueta_1$, 1)

		ultimo_caracter_1$ = right$(etiqueta_1$, 1)


		if startsWith(etiqueta_1$, " ")

			largo = length(etiqueta_1$)

			#appendInfoLine: i_inter, tab$, largo

			nueva_etiqueta_1$ = right$(etiqueta_1$, largo-1)

			#appendInfoLine: etiqueta_1$

			#appendInfoLine: nueva_etiqueta_1$

			Set interval text: 1, i_inter, nueva_etiqueta_1$

			contador_espacios_iniciales = contador_espacios_iniciales + 1
	
		endif


		if endsWith(etiqueta_1$, " ")

			largo = length(etiqueta_1$)

			#appendInfoLine: i_inter, tab$, largo

			nueva_etiqueta_1$ = left$(etiqueta_1$, largo-1)

			#appendInfoLine: etiqueta_1$

			#appendInfoLine: nueva_etiqueta_1$

			Set interval text: 1, i_inter, nueva_etiqueta_1$

			contador_espacios_finales = contador_espacios_finales + 1
	
		endif

	endfor



	for i_inter to ene_intervalos_2

		etiqueta_2$ = Get label of interval: 2, i_inter

		primer_caracter_2$ = left$(etiqueta_2$, 1)

		ultimo_caracter_2$ = right$(etiqueta_2$, 1)


		if startsWith(etiqueta_2$, " ")

			largo = length(etiqueta_2$)

			#appendInfoLine: i_inter, tab$, largo

			nueva_etiqueta_2$ = right$(etiqueta_2$, largo-1)

			#appendInfoLine: etiqueta_2$

			#appendInfoLine: nueva_etiqueta_2$

			Set interval text: 2, i_inter, nueva_etiqueta_2$

			contador_espacios_iniciales = contador_espacios_iniciales + 1
	
		endif


		if endsWith(etiqueta_2$, " ")

			largo = length(etiqueta_2$)

			#appendInfoLine: i_inter, tab$, largo

			nueva_etiqueta_2$ = left$(etiqueta_2$, largo-1)

			#appendInfoLine: etiqueta_2$

			#appendInfoLine: nueva_etiqueta_2$

			Set interval text: 2, i_inter, nueva_etiqueta_2$

			contador_espacios_finales = contador_espacios_finales + 1
	
		endif

	endfor




	for i_inter to ene_intervalos_3

		etiqueta_3$ = Get label of interval: 3, i_inter

		primer_caracter_3$ = left$(etiqueta_3$, 1)

		ultimo_caracter_3$ = right$(etiqueta_3$, 1)


		if startsWith(etiqueta_3$, " ")

			largo = length(etiqueta_3$)

			#appendInfoLine: i_inter, tab$, largo

			nueva_etiqueta_3$ = right$(etiqueta_3$, largo-1)

			#appendInfoLine: etiqueta_3$

			#appendInfoLine: nueva_etiqueta_3$

			Set interval text: 3, i_inter, nueva_etiqueta_3$

			contador_espacios_iniciales = contador_espacios_iniciales + 1
	
		endif


		if endsWith(etiqueta_3$, " ")

			largo = length(etiqueta_3$)

			#appendInfoLine: i_inter, tab$, largo

			nueva_etiqueta_3$ = left$(etiqueta_3$, largo-1)

			#appendInfoLine: etiqueta_3$

			#appendInfoLine: nueva_etiqueta_3$

			Set interval text: 3, i_inter, nueva_etiqueta_3$

			contador_espacios_finales = contador_espacios_finales + 1
	
		endif

	endfor


	for i_inter to ene_intervalos_4

		etiqueta_4$ = Get label of interval: 4, i_inter

		primer_caracter_4$ = left$(etiqueta_4$, 1)

		ultimo_caracter_4$ = right$(etiqueta_4$, 1)


		if startsWith(etiqueta_4$, " ")
	
			largo = length(etiqueta_4$)

			#appendInfoLine: i_inter, tab$, largo

			nueva_etiqueta_4$ = right$(etiqueta_4$, largo-1)

			#appendInfoLine: etiqueta_4$

			#appendInfoLine: nueva_etiqueta_4$

			Set interval text: 4, i_inter, nueva_etiqueta_4$

			contador_espacios_iniciales = contador_espacios_iniciales + 1
	
		endif


		if endsWith(etiqueta_4$, " ")

			largo = length(etiqueta_4$)

			#appendInfoLine: i_inter, tab$, largo

			nueva_etiqueta_4$ = left$(etiqueta_4$, largo-1)

			#appendInfoLine: etiqueta_4$

			#appendInfoLine: nueva_etiqueta_4$

			Set interval text: 4, i_inter, nueva_etiqueta_4$

			contador_espacios_finales = contador_espacios_finales + 1
	
		endif

	endfor

appendInfoLine: textg$,tab$, "analizado"

endfor



appendInfoLine: "Sustituciones de espacios iniciales: " + fixed$(contador_espacios_iniciales, 0)
appendInfoLine: "Sustituciones de espacios finales: " + fixed$(contador_espacios_finales, 0)

appendInfoLine: "Sustituciones de espacios iniciales: " + fixed$(contador_espacios_iniciales, 0)
appendInfoLine: "Sustituciones de espacios finales: " + fixed$(contador_espacios_finales, 0)
