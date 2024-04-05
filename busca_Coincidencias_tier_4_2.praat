## nuevo 29 marzo

# buscar si coincide el intervalo del tier 2 con el del tier 4

writeInfoLine: "=========="

tg = selected("TextGrid")


select tg

n_intervalos_tier_2 = Get number of intervals: 2

n_intervalos_tier_4 = Get number of intervals: 4


## inicializa los contadores


for i to n_intervalos_tier_4

	select tg

	etiqueta4$ = Get label of interval: 4, i

	if etiqueta4$ <> "" and etiqueta4$ <> "<P>" and etiqueta4$ <> "<pl>" and etiqueta4$ <> "<pb>"

		ini_intervalo_tier_4 = Get start time of interval: 4, i

		fin_intervalo_tier_4 = Get end time of interval: 4, i

		intervalo_t4_A = Get interval at time: 2, ini_intervalo_tier_4

		intervalo_t4_B = Get interval at time: 2, fin_intervalo_tier_4

		if intervalo_t4_B == intervalo_t4_A + 1

			verso_curva = 1

		elsif intervalo_t4_B == intervalo_t4_A + 2

			etiqueta_anterior_tier_2$ = Get label of interval: 2, intervalo_t4_A

				if etiqueta_anterior_tier_2$ == "<pl>" or etiqueta_anterior_tier_2$ == "<pb>" 

					#appendInfoLine: "Coinciden caso <pl> o <pb>"

					verso_curva = 1

				endif

		else
					verso_curva = 0

		endif

		appendInfoLine: i, tab$, verso_curva

	endif

endfor
