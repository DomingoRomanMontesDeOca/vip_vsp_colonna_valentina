# corrector de etiquetas

tg = selected("TextGrid")

n_intervalos_tier_1 = Get number of intervals: 1
n_intervalos_tier_2 = Get number of intervals: 2
n_intervalos_tier_3 = Get number of intervals: 3
n_intervalos_tier_4 = Get number of intervals: 4

contador_etiquetas_inicio_espacio_tier_1 = 0
contador_etiquetas_inicio_espacio_tier_2 = 0
contador_etiquetas_inicio_espacio_tier_3 = 0
contador_etiquetas_inicio_espacio_tier_4 = 0

writeInfoLine: "Se eliminan los espacios iniciales en las etiquetas de pausas"
appendInfoLine: "================="


for i to n_intervalos_tier_1

	select tg

	etiqueta_t1$ = Get label of interval: 1, i

	primer_caracter_t1$ = left$(etiqueta_t1$, 2)

		if primer_caracter_t1$ == " <"
			appendInfoLine: i,tab$,etiqueta_t1$
			contador_etiquetas_inicio_espacio_tier_1 = contador_etiquetas_inicio_espacio_tier_1 + 1
			etiqueta_t1$ = replace$ (etiqueta_t1$," <", "<",1)
			Set interval text: 1, i, etiqueta_t1$
		endif

endfor

appendInfoLine: "Se han realizado ", contador_etiquetas_inicio_espacio_tier_1, " eliminaciones de espacio inicial en etiquetas del tier 1"


for i to n_intervalos_tier_2

	select tg

	etiqueta_t2$ = Get label of interval: 2, i

	primer_caracter_t2$ = left$(etiqueta_t2$, 2)

		if primer_caracter_t2$ == " <"
			appendInfoLine: i,tab$,etiqueta_t2$
			contador_etiquetas_inicio_espacio_tier_2 = contador_etiquetas_inicio_espacio_tier_2 + 1
			etiqueta_t2$ = replace$ (etiqueta_t2$," <", "<",1)
			Set interval text: 2, i, etiqueta_t2$
		endif
endfor


appendInfoLine: "Se han realizado ", contador_etiquetas_inicio_espacio_tier_2, " eliminaciones de espacio inicial en etiquetas del tier 2"




for i to n_intervalos_tier_3

	select tg

	etiqueta_t3$ = Get label of interval: 3, i

	primer_caracter_t3$ = left$(etiqueta_t3$, 2)

		if primer_caracter_t3$ == " <"
			appendInfoLine: i,tab$,etiqueta_t3$
			contador_etiquetas_inicio_espacio_tier_3 = contador_etiquetas_inicio_espacio_tier_3 + 1
			etiqueta_t3$ = replace$ (etiqueta_t3$," <", "<",1)
			Set interval text: 3, i, etiqueta_t3$
		endif
endfor


appendInfoLine: "Se han realizado ", contador_etiquetas_inicio_espacio_tier_3, " eliminaciones de espacio inicial en etiquetas del tier 3"






for i to n_intervalos_tier_4

	select tg

	etiqueta_t4$ = Get label of interval: 4, i

	primer_caracter_t4$ = left$(etiqueta_t4$, 2)

		if primer_caracter_t4$ == " <"
			appendInfoLine: i,tab$,etiqueta_t4$
			contador_etiquetas_inicio_espacio_tier_4 = contador_etiquetas_inicio_espacio_tier_4 + 1
			etiqueta_t4$ = replace$ (etiqueta_t4$," <", "<",1)
			Set interval text: 4, i, etiqueta_t4$
		endif
endfor


appendInfoLine: "Se han realizado ", contador_etiquetas_inicio_espacio_tier_4, " eliminaciones de espacio inicial en etiquetas del tier 4"



