# si tiene título, eliminar los intervalos 2 y 3
# cambiar el texto por una cadena vacía
# elimina los tres primeros puntos del tier 5
# elimina el primer punto del tier 6

tg = selected("TextGrid")

Remove right boundary: 1, 1
Remove right boundary: 1, 1
Set interval text: 1, 1, ""

Remove right boundary: 2, 1
Remove right boundary: 2, 1
Set interval text: 2, 1, ""
Remove right boundary: 3, 1
Remove right boundary: 3, 1
Set interval text: 3, 1, ""
Remove right boundary: 4, 1
Remove right boundary: 4, 1
Set interval text: 4, 1, ""

Remove point: 5, 1
Remove point: 5, 1
Remove point: 5, 1
Remove point: 6, 1
