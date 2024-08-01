# Corrector de etiquetas en TextGrid
# Proyecto VSP Valentina Colonna
# Valentina Colonna y Domingo Román
# 2024, agosto 1.

# Pide el directorio de trabajo y crea un strings con todos los nombres de los TextGrids.
# Abre cada TextGrid y elimina, cada vez que se aplica, un espacio en blanco inicial o finales en cada etiqueta de los cuatro tiers.

# Si el número de espacios eliminados no es "0", recomienda volver a aplicar el script. A la inversa,
# cuando se obtiene "0 espacios eliminados" se recomienda no volver a aplicar el script.

# Cada vez que se aplica el script, guarda en el mismo directorio cada uno de los TextGrids.

# inicio de contadores

contador_espacios_iniciales = 0

contador_espacios_finales = 0


directorio$ = chooseDirectory$ ("Elija directorio con archivos")

strings1 = Create Strings as file list... lista_1 'directorio$'/*.TextGrid

# la extensión puede ser otra, ciertamente

ene_archivos = Get number of strings


writeInfoLine: "======"
appendInfoLine: " *** R E P O R T E *** "

for i to ene_archivos

	select strings1

	textg$ = Get string... i

	tg = Read from file... 'directorio$'/'textg$'

	ene_tiers = Get number of tiers

	# Advierte en caso de que no hayan cuatro tiers

	if ene_tiers <> 4

		appendInfoLine: textg$, " tiene ", fixed$(ene_tiers,0), " tiers"

	endif

	ene_intervalos_1 = Get number of intervals: 1

	ene_intervalos_2 = Get number of intervals: 2

	ene_intervalos_3 = Get number of intervals: 3

	ene_intervalos_4 = Get number of intervals: 4


	for i_inter to ene_intervalos_1

		etiqueta_1$ = Get label of interval: 1, i_inter


		if startsWith(etiqueta_1$, " ")

			largo = length(etiqueta_1$)

			nueva_etiqueta_1$ = right$(etiqueta_1$, largo-1)

			Set interval text: 1, i_inter, nueva_etiqueta_1$

			contador_espacios_iniciales = contador_espacios_iniciales + 1
	
		endif


		if endsWith(etiqueta_1$, " ")

			largo = length(etiqueta_1$)

			nueva_etiqueta_1$ = left$(etiqueta_1$, largo-1)

			Set interval text: 1, i_inter, nueva_etiqueta_1$

			contador_espacios_finales = contador_espacios_finales + 1
	
		endif

	endfor



	for i_inter to ene_intervalos_2

		etiqueta_2$ = Get label of interval: 2, i_inter


		if startsWith(etiqueta_2$, " ")

			largo = length(etiqueta_2$)

			nueva_etiqueta_2$ = right$(etiqueta_2$, largo-1)

			Set interval text: 2, i_inter, nueva_etiqueta_2$

			contador_espacios_iniciales = contador_espacios_iniciales + 1
	
		endif


		if endsWith(etiqueta_2$, " ")

			largo = length(etiqueta_2$)

			nueva_etiqueta_2$ = left$(etiqueta_2$, largo-1)

			Set interval text: 2, i_inter, nueva_etiqueta_2$

			contador_espacios_finales = contador_espacios_finales + 1
	
		endif

	endfor




	for i_inter to ene_intervalos_3

		etiqueta_3$ = Get label of interval: 3, i_inter


		if startsWith(etiqueta_3$, " ")

			largo = length(etiqueta_3$)

			nueva_etiqueta_3$ = right$(etiqueta_3$, largo-1)

			Set interval text: 3, i_inter, nueva_etiqueta_3$

			contador_espacios_iniciales = contador_espacios_iniciales + 1
	
		endif


		if endsWith(etiqueta_3$, " ")

			largo = length(etiqueta_3$)

			nueva_etiqueta_3$ = left$(etiqueta_3$, largo-1)

			Set interval text: 3, i_inter, nueva_etiqueta_3$

			contador_espacios_finales = contador_espacios_finales + 1
	
		endif

	endfor


	for i_inter to ene_intervalos_4

		etiqueta_4$ = Get label of interval: 4, i_inter

		if startsWith(etiqueta_4$, " ")
	
			largo = length(etiqueta_4$)

			nueva_etiqueta_4$ = right$(etiqueta_4$, largo-1)

			Set interval text: 4, i_inter, nueva_etiqueta_4$

			contador_espacios_iniciales = contador_espacios_iniciales + 1
	
		endif

		if endsWith(etiqueta_4$, " ")

			largo = length(etiqueta_4$)

			nueva_etiqueta_4$ = left$(etiqueta_4$, largo-1)

			Set interval text: 4, i_inter, nueva_etiqueta_4$

			contador_espacios_finales = contador_espacios_finales + 1
	
		endif

	endfor

	Save as text file: "'directorio$'/'textg$'"

	appendInfoLine: textg$,tab$, "analizado"

	select tg

	Remove

endfor

select strings1
Remove

appendInfoLine: "Sustituciones de espacios iniciales: " + fixed$(contador_espacios_iniciales, 0)
appendInfoLine: "Sustituciones de espacios finales: " + fixed$(contador_espacios_finales, 0)
appendInfoLine: "..."
appendInfoLine: "..."
appendInfoLine: "..."
appendInfoLine: "Recomendación..."

if contador_espacios_iniciales <> 0 or contador_espacios_finales <> 0

	appendInfoLine: "Aplique nuevamente el script :) "

elsif contador_espacios_iniciales == 0 and contador_espacios_finales == 0

	appendInfoLine: "No vuelva a aplicar el script. Todo está Ok! ;) "

endif

