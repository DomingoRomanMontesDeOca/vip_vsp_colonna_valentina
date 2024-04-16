# 16 de abril
# cambio el enfoque
# parto del tier 2

tg = selected("TextGrid")
select tg

n_intervalos_tier_2 = Get number of intervals: 2

n_intervalos_tier_4 = Get number of intervals: 4



# Recorre todos los intervalos del tier 2 (CP)


writeInfoLine: "============="

tabla_provisoria = Create Table with column names: "provisoria", 19, { "a", "b", "c" }

contador_casos = 0

for i to n_intervalos_tier_2

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



