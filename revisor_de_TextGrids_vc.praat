# Revision de TextGrids para Valentina Colonna

# Problemas detectados

writeInfoLine: "======="
contador_general_de_problemas = 0 







tg = selected("TextGrid")
tg$ = selected$("TextGrid")



ene_estratos = Get number of tiers

duracion = Get total duration

ene_intervalos_tier_1 = Count intervals where: 1, "is equal to", ""

if ene_intervalos_tier_1 <> 2

	appendInfoLine: "Revisar etiquetas de tier 1: hay " + fixed$(ene_intervalos_tier_1,0) + " intervalos vacíos"
	contador_general_de_problemas = contador_general_de_problemas + 1
endif


ene_intervalos_tier_2 = Count intervals where: 2, "is equal to", ""


if ene_intervalos_tier_2 <> 2

	appendInfoLine: "Revisar etiquetas de tier 2: hay " + fixed$(ene_intervalos_tier_2,0) + " intervalos vacíos"
	contador_general_de_problemas = contador_general_de_problemas + 1
endif







ene_intervalos_tier_3 = Count intervals where: 3, "is equal to", ""


if ene_intervalos_tier_3 <> 2

	appendInfoLine: "Revisar etiquetas de tier 3: hay " + fixed$(ene_intervalos_tier_3,0) + " intervalos vacíos"
	contador_general_de_problemas = contador_general_de_problemas + 1
endif





ene_intervalos_tier_4 = Count intervals where: 4, "is equal to", ""

if ene_intervalos_tier_4 <> 2

	appendInfoLine: "Revisar etiquetas de tier 4: hay " + fixed$(ene_intervalos_tier_4,0) + " intervalos vacíos"
	contador_general_de_problemas = contador_general_de_problemas + 1
endif





## Tier 5
# debe ser divisible por 3

ene_puntos_tier_5 = Get number of points: 5

mod_div_por_3 = ene_puntos_tier_5 mod 3

if mod_div_por_3 <> 0

	appendInfoLine: "Revisar tier número de marcas en tier 5"

	
if ene_intervalos_tier_1 <> 2

	appendInfoLine: "Revisar etiquetas de tier 1: hay " + fixed$(ene_intervalos_tier_1,0) + " intervalos vacíos"
	contador_general_de_problemas = contador_general_de_problemas + 1
endif



endif


for i to ene_puntos_tier_5

	etiqueta_5$ = Get label of point: 5, i

	if etiqueta_5$ <> "A" and  etiqueta_5$ <> "B" and etiqueta_5$ <> "C"
	
		appendInfoLine: "Etiqueta " + fixed$(i,0) + " en tier 5 mal puesta"

		contador_general_de_problemas = contador_general_de_problemas + 1

	endif

endfor


##### tier 6

ene_6 = Get number of points: 6

for i to ene_6

	etiqueta_6$ = Get label of point: 6, i

	if etiqueta_6$ == "" or etiqueta_6$ == "  "

		appendInfoLine: "Hay problema en tier 6 con la etiqueta " + fixed$(i,0)
		
		contador_general_de_problemas = contador_general_de_problemas + 1


	endif

endfor


##### tier 8

ene_8 = Get number of points: 8

if ene_8 <> 0

	if ene_8 = 1

		appendInfoLine: "Tiene solo una marca en tier 8"

		
		contador_general_de_problemas = contador_general_de_problemas + 1


	endif

endif


for i to ene_8

	etiqueta_8$ = Get label of point: 8, i

	if etiqueta_8$ == "" or etiqueta_8$ == "  "

		appendInfoLine: "Hay problema en tier 8 con la etiqueta " + fixed$(i,0)

		
		contador_general_de_problemas = contador_general_de_problemas + 1


	endif

endfor






##### tier 9


ene_9 = Get number of points: 9


if ene_9 <> 0

	mod_pares_tier_9 = ene_9 mod 2

	if mod_pares_tier_9 <> 0

		appendInfoLine: "Deben ser número par de marcas en tier 9"

		
		contador_general_de_problemas = contador_general_de_problemas + 1


	endif

endif


## tier 10

ene_10 = Get number of points: 10


if ene_10 <> 0

	mod_3_tier_10 = ene_10 mod 3

	if mod_3_tier_10 <> 0

		appendInfoLine: "Deben ser múltiplo de 3 el número de marcas en tier 10"

		
		contador_general_de_problemas = contador_general_de_problemas + 1


	endif

endif


appendInfoLine: "======== G E N E R A L =========="

appendInfoLine: "El TextGrid " + tg$ + " presenta " + fixed$(contador_general_de_problemas,0) + " problemas."
