tg = selected("TextGrid")

sn = selected("Sound")
sn$ = selected$("Sound")

tono = selected("Pitch")

writeInfoLine: "==========00=========="
# tier 2 = CP o curva prosódica



# inicia contador de intervalos sin considerar las pausa

contador_de_intervalos_sin_pausa = 0


select tg
ene_intervalos_tier_2 = Get number of intervals: 2

for i to ene_intervalos_tier_2

	etiqueta$ = Get label of interval: 2, i

	if etiqueta$ <> "<pl>" and etiqueta$ <> "<pb>" and etiqueta$ <> "<pm>" and etiqueta$ <> "<pll>" and etiqueta$ <> "<P>" and etiqueta$ <> ""
		
	contador_de_intervalos_sin_pausa = contador_de_intervalos_sin_pausa + 1

	endif

endfor


# el contador de intervalos sin contar las pausas está completo


# crea la tabla con los datos
tabla_por_curva = Create Table with column names: "table", contador_de_intervalos_sin_pausa, { "n_cp","texto", "n_silabas", "duracion", "n_pr", "vel_eloc", "st", "x_hz", "dif_max_min_db", " x_db", "interrup", "sinonim", "declarat_poet", "focus", "encabalga" }


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

	select tono

	x_f0 = Get mean: ini, fin, "Hertz"


	if etiqueta2$ <> "<pl>" and etiqueta2$ <> "<pb>" and etiqueta2$ <> "<pm>" and etiqueta2$ <> "<pll>" and etiqueta2$ <> "<P>" and etiqueta2$ <> ""

		contador_etiquetas = contador_etiquetas + 1

		select tabla_por_curva

		Set string value: contador_etiquetas, "texto", etiqueta2$

		Set numeric value: contador_etiquetas, "duracion", dur

		Set numeric value: contador_etiquetas, "x_hz", x_f0


	endif
		
endfor






##########################




#Número de curvas prosódicas

#número de palabra rítmica

#"dif_max_min_db" + tier

#declarat tipo específico de prosodia

#focus

#st rango de st

#verso curva / correspondencia

 #"n_sil_p_pr"#


#vs(CP): verso curva cuando coincide con n_cp
#CP(vs): hemiverso. Cada curva incluye porciones del verso

#interverso

#una curva prosódica con más versos curva poliverso


#verso y curva prosódica


#tabla 
#	curvas prosódicas	pausas	
