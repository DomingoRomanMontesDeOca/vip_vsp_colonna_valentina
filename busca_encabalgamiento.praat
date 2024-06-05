#  encabalgamiento por CP

writeInfoLine: "==="


tg = selected("TextGrid")

select tg

ene_versos = Get number of intervals: 4

appendInfoLine: ene_versos

for i to ene_versos

	select tg

	verso$ = Get label of interval: 4, i

	if verso$ <> "" and verso$ <> "<P>" and verso$ <> "<pl>" and verso$ <> "<pb>" and verso$ <> "<pm>" and verso$ <> "<pll>" and verso$ <> "<P>" and verso$ <> "" and verso$ <> "  "

		largo_verso = length(verso$)

		ultimo_caracter$ = mid$(verso$,largo_verso,1)

			if ultimo_caracter$ <> "." and ultimo_caracter$ <> "," and ultimo_caracter$ <> "!" and ultimo_caracter$ <> ";" and ultimo_caracter$ <> ":" and ultimo_caracter$ <> "\?" and ultimo_caracter$ <> "\)" and ultimo_caracter$ <> "\—"

				cara = 1

			else

				cara = 0

			endif

			appendInfoLine: verso$,tab$,tab$,tab$,tab$,ultimo_caracter$, tab$, cara
	endif

endfor



# and ultimo_caracter$ == "\?" and ultimo_caracter$ == ")" and ultimo_caracter$ == "—"

# revisar otras posibilidades

