
# Establece el directorio de trabajo
setwd("/Users/guru/Documents/Copos2024_junio_20")

# Confirma que estés en el directorio correcto
getwd()


# crea dos listas para las etiquetas en los gráficos
sexos = c("Hombres", "Mujeres")
poemas = c("Rasgos", "Paisaje", "Romance sonámbulo")



# Lee el archivo y lo convierte en un objeto en R. En este caso, el objeto se llama
# data_versos y correspondea la lectura del archivo tipo csv llamado "tabla_por_verso.Table"
# creado en Praat y que está en el directorio definido como directorio de trabajo


data_versos <- read.csv("tabla_por_verso.Table")


# revisa la estructura de los datos
str(data_versos)


# entrega esto:

# 'data.frame':	389 obs. of  12 variables:
# $ apellido_lector : Factor w/ 9 levels "Antunez","Bernier",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ diferen_apellido: int  0 0 0 0 0 0 0 0 0 0 ...
# $ sexo            : Factor w/ 2 levels "f","m": 2 2 2 2 2 2 2 2 2 2 ...
# $ ciudad          : Factor w/ 4 levels "Cord","Coru",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ autor           : Factor w/ 1 level "Lorca": 1 1 1 1 1 1 1 1 1 1 ...
# $ n_poema         : int  1 1 1 1 1 1 1 1 1 4 ...
# $ verso           : Factor w/ 27 levels "1","1§","10",..: 1 12 14 16 18 20 22 24 26 2 ...
# $ Xf0             : num  108.2 97.6 88.8 97.7 92.5 ...
# $ st              : num  3.99 4.14 2.31 3.87 3.44 ...
# $ dur             : num  0.759 0.769 0.813 0.627 0.671 ...
# $ velocidad       : num  6.59 3.9 6.15 6.38 4.47 ...
# $ pendiente       : num  5.26 -5.38 -2.84 6.17 -5.12 ...

# es importante verificar que las variables que se van a cuantificar sean de nipo numéricas
# aquí dice que la variable Xf0 es "num". Todo está bien.
## $ Xf0             : num  108.2 97.6 88.8 97.7 92.5 ...



# la columna 6 tiene el número del poema (1, 4 o 7)

# la columna 7 tiene el número de cada verso en cada poema

# la columna 9 tiene los valores en st entre máx mín de f0 de cada verso

# la columna 10 tiene los valores de duración de cada verso

# la columna 11 tiene los valores de velocidad por verso

# la columna 12 tiene los valores de la pendiente en cada verso



# se crean dos subsets de datos, uno con todos los casos de data_versos que tienen en la variable "sexo" en valor "m". Otro para el femenino.
masc <- subset(data_versos, sexo == 'm')
feme <- subset(data_versos, sexo == 'f')


# ahora se crea subset de masc y feme con cada poema

masc_poema_1 <- subset(masc, n_poema == "1")
feme_poema_1 <- subset(feme, n_poema == "1")

# Análisis por verso.
# en esta parte se crean subsets por cada verso para cada poema tanto para hombres como para mujeres


masc_poema_1_verso_1 <- subset(masc_poema_1, verso == "1")
feme_poema_1_verso_1 <- subset(feme_poema_1, verso == "1")

masc_poema_1_verso_2 <- subset(masc_poema_1, verso == "2")
feme_poema_1_verso_2 <- subset(feme_poema_1, verso == "2")

masc_poema_1_verso_3 <- subset(masc_poema_1, verso == "3")
feme_poema_1_verso_3 <- subset(feme_poema_1, verso == "3")

masc_poema_1_verso_4 <- subset(masc_poema_1, verso == "4")
feme_poema_1_verso_4 <- subset(feme_poema_1, verso == "4")

masc_poema_1_verso_5 <- subset(masc_poema_1, verso == "5")
feme_poema_1_verso_5 <- subset(feme_poema_1, verso == "5")

masc_poema_1_verso_6 <- subset(masc_poema_1, verso == "6")
feme_poema_1_verso_6 <- subset(feme_poema_1, verso == "6")

masc_poema_1_verso_7 <- subset(masc_poema_1, verso == "7")
feme_poema_1_verso_7 <- subset(feme_poema_1, verso == "7")

masc_poema_1_verso_8 <- subset(masc_poema_1, verso == "8")
feme_poema_1_verso_8 <- subset(feme_poema_1, verso == "8")

masc_poema_1_verso_9 <- subset(masc_poema_1, verso == "9")
feme_poema_1_verso_9 <- subset(feme_poema_1, verso == "9")


# ahora se revisa para cada verso de cada poema las variables de st, duración, velocidad y pendiente.
# la expresión [,9] significa que de ese subset se tomarán todos los valores de la columna 9,
# mean es la función de R para el promedio
# El primer elemento antes del signo (por ejemplo, m_xst_p1_v1) en el nombre que yo le doy a ese resultado.
# en este caso, m_xst_p1_v1 es el promedio de los valores de la columna 9 del subset masc_poema_1_verso_1


# ANÁLISIS DE ST ENTRE MÁX Y MÍN POR VERSO EN CADA POEMA

# POEMA 1

# masc
m_xst_p1_v1 = mean(masc_poema_1_verso_1[,9])
m_xst_p1_v2 = mean(masc_poema_1_verso_2[,9])
m_xst_p1_v3 = mean(masc_poema_1_verso_3[,9])
m_xst_p1_v4 = mean(masc_poema_1_verso_4[,9])
m_xst_p1_v5 = mean(masc_poema_1_verso_5[,9])
m_xst_p1_v6 = mean(masc_poema_1_verso_6[,9])
m_xst_p1_v7 = mean(masc_poema_1_verso_7[,9])
m_xst_p1_v8 = mean(masc_poema_1_verso_8[,9])
m_xst_p1_v9 = mean(masc_poema_1_verso_9[,9])


# feme
f_xst_p1_v1 = mean(feme_poema_1_verso_1[,9])
f_xst_p1_v2 = mean(feme_poema_1_verso_2[,9])
f_xst_p1_v3 = mean(feme_poema_1_verso_3[,9])
f_xst_p1_v4 = mean(feme_poema_1_verso_4[,9])
f_xst_p1_v5 = mean(feme_poema_1_verso_5[,9])
f_xst_p1_v6 = mean(feme_poema_1_verso_6[,9])
f_xst_p1_v7 = mean(feme_poema_1_verso_7[,9])
f_xst_p1_v8 = mean(feme_poema_1_verso_8[,9])
f_xst_p1_v9 = mean(feme_poema_1_verso_9[,9])


# con la expresión "c(..." se crea una concatenación de datos.
# aquí, masc_x_xst_p1 es la concatenación de los promedios (m_xst_p1_v1, m_xst_p1_v2, etc.)
# estas variables concatenadas son las que se usan en los gráficos de la sección gráficos.

masc_x_xst_p1 = c(m_xst_p1_v1, m_xst_p1_v2, m_xst_p1_v3, m_xst_p1_v4, m_xst_p1_v5, m_xst_p1_v6, m_xst_p1_v7, m_xst_p1_v8, m_xst_p1_v9 )
feme_x_xst_p1 = c(f_xst_p1_v1, f_xst_p1_v2, f_xst_p1_v3, f_xst_p1_v4, f_xst_p1_v5, f_xst_p1_v6, f_xst_p1_v7, f_xst_p1_v8, f_xst_p1_v9 )






# POEMA 4

masc_poema_4 <- subset(masc, n_poema == "4")
feme_poema_4 <- subset(feme, n_poema == "4")

masc_poema_4_verso_1 <- subset(masc_poema_4, verso == "1§")
feme_poema_4_verso_1 <- subset(feme_poema_4, verso == "1§")

masc_poema_4
masc_poema_4_verso_2 <- subset(masc_poema_4, verso == "2§")
feme_poema_4_verso_2 <- subset(feme_poema_4, verso == "2§")

masc_poema_4_verso_3 <- subset(masc_poema_4, verso == "3§")
feme_poema_4_verso_3 <- subset(feme_poema_4, verso == "3§")

masc_poema_4_verso_4 <- subset(masc_poema_4, verso == "4§")
feme_poema_4_verso_4 <- subset(feme_poema_4, verso == "4§")

masc_poema_4_verso_5 <- subset(masc_poema_4, verso == "5§")
feme_poema_4_verso_5 <- subset(feme_poema_4, verso == "5§")

masc_poema_4_verso_6 <- subset(masc_poema_4, verso == "6§")
feme_poema_4_verso_6 <- subset(feme_poema_4, verso == "6§")

masc_poema_4_verso_7 <- subset(masc_poema_4, verso == "7§")
feme_poema_4_verso_7 <- subset(feme_poema_4, verso == "7§")

masc_poema_4_verso_8 <- subset(masc_poema_4, verso == "8§")
feme_poema_4_verso_8 <- subset(feme_poema_4, verso == "8§")

masc_poema_4_verso_9 <- subset(masc_poema_4, verso == "9§")
feme_poema_4_verso_9 <- subset(feme_poema_4, verso == "9§")

masc_poema_4_verso_10 <- subset(masc_poema_4, verso == "10")
feme_poema_4_verso_10 <- subset(feme_poema_4, verso == "10")

masc_poema_4_verso_11 <- subset(masc_poema_4, verso == "11")
feme_poema_4_verso_11 <- subset(feme_poema_4, verso == "11")

masc_poema_4_verso_12 <- subset(masc_poema_4, verso == "12")
feme_poema_4_verso_12 <- subset(feme_poema_4, verso == "12")

masc_poema_4_verso_13 <- subset(masc_poema_4, verso == "13")
feme_poema_4_verso_13 <- subset(feme_poema_4, verso == "13")

masc_poema_4_verso_14 <- subset(masc_poema_4, verso == "14")
feme_poema_4_verso_14 <- subset(feme_poema_4, verso == "14")

masc_poema_4_verso_15 <- subset(masc_poema_4, verso == "15")
feme_poema_4_verso_15 <- subset(feme_poema_4, verso == "15")

masc_poema_4_verso_16 <- subset(masc_poema_4, verso == "16")
feme_poema_4_verso_16 <- subset(feme_poema_4, verso == "16")

masc_poema_4_verso_17 <- subset(masc_poema_4, verso == "17")
feme_poema_4_verso_17 <- subset(feme_poema_4, verso == "17")

masc_poema_4_verso_18 <- subset(masc_poema_4, verso == "18")
feme_poema_4_verso_18 <- subset(feme_poema_4, verso == "18")


m_xst_p4_v1 = mean(masc_poema_4_verso_1[,9])
m_xst_p4_v2 = mean(masc_poema_4_verso_2[,9])
m_xst_p4_v3 = mean(masc_poema_4_verso_3[,9])
m_xst_p4_v4 = mean(masc_poema_4_verso_4[,9])
m_xst_p4_v5 = mean(masc_poema_4_verso_5[,9])
m_xst_p4_v6 = mean(masc_poema_4_verso_6[,9])
m_xst_p4_v7 = mean(masc_poema_4_verso_7[,9])
m_xst_p4_v8 = mean(masc_poema_4_verso_8[,9])
m_xst_p4_v9 = mean(masc_poema_4_verso_9[,9])
m_xst_p4_v10 = mean(masc_poema_4_verso_10[,9])
m_xst_p4_v11 = mean(masc_poema_4_verso_11[,9])
m_xst_p4_v12 = mean(masc_poema_4_verso_12[,9])
m_xst_p4_v13 = mean(masc_poema_4_verso_13[,9])
m_xst_p4_v14 = mean(masc_poema_4_verso_14[,9])
m_xst_p4_v15 = mean(masc_poema_4_verso_15[,9])
m_xst_p4_v16 = mean(masc_poema_4_verso_16[,9])
m_xst_p4_v17 = mean(masc_poema_4_verso_17[,9])
m_xst_p4_v18 = mean(masc_poema_4_verso_18[,9])

# feme
f_xst_p4_v1 = mean(feme_poema_4_verso_1[,9])
f_xst_p4_v2 = mean(feme_poema_4_verso_2[,9])
f_xst_p4_v3 = mean(feme_poema_4_verso_3[,9])
f_xst_p4_v4 = mean(feme_poema_4_verso_4[,9])
f_xst_p4_v5 = mean(feme_poema_4_verso_5[,9])
f_xst_p4_v6 = mean(feme_poema_4_verso_6[,9])
f_xst_p4_v7 = mean(feme_poema_4_verso_7[,9])
f_xst_p4_v8 = mean(feme_poema_4_verso_8[,9])
f_xst_p4_v9 = mean(feme_poema_4_verso_9[,9])
f_xst_p4_v10 = mean(feme_poema_4_verso_10[,9])
f_xst_p4_v11 = mean(feme_poema_4_verso_11[,9])
f_xst_p4_v12 = mean(feme_poema_4_verso_12[,9])
f_xst_p4_v13 = mean(feme_poema_4_verso_13[,9])
f_xst_p4_v14 = mean(feme_poema_4_verso_14[,9])
f_xst_p4_v15 = mean(feme_poema_4_verso_15[,9])
f_xst_p4_v16 = mean(feme_poema_4_verso_16[,9])
f_xst_p4_v17 = mean(feme_poema_4_verso_17[,9])
f_xst_p4_v18 = mean(feme_poema_4_verso_18[,9])


masc_x_xst_p4 = c(m_xst_p4_v1, m_xst_p4_v2, m_xst_p4_v3, m_xst_p4_v4, m_xst_p4_v5, m_xst_p4_v6, m_xst_p4_v7, m_xst_p4_v8, m_xst_p4_v9, m_xst_p4_v10, m_xst_p4_v11, m_xst_p4_v12, m_xst_p4_v13, m_xst_p4_v14, m_xst_p4_v15, m_xst_p4_v16, m_xst_p4_v17, m_xst_p4_v18)

feme_x_xst_p4 = c(f_xst_p4_v1, f_xst_p4_v2, f_xst_p4_v3, f_xst_p4_v4, f_xst_p4_v5, f_xst_p4_v6, f_xst_p4_v7, f_xst_p4_v8, f_xst_p4_v9, f_xst_p4_v10, f_xst_p4_v11, f_xst_p4_v12, f_xst_p4_v13, f_xst_p4_v14, f_xst_p4_v15, f_xst_p4_v16, f_xst_p4_v17, f_xst_p4_v18)



# POEMA 7

masc_poema_7 <- subset(masc, n_poema == "7")
feme_poema_7 <- subset(feme, n_poema == "7")


masc_poema_7_verso_1 <- subset(masc_poema_7, verso == "1§")
feme_poema_7_verso_1 <- subset(feme_poema_7, verso == "1§")

masc_poema_7_verso_2 <- subset(masc_poema_7, verso == "2§")
feme_poema_7_verso_2 <- subset(feme_poema_7, verso == "2§")

masc_poema_7_verso_3 <- subset(masc_poema_7, verso == "3§")
feme_poema_7_verso_3 <- subset(feme_poema_7, verso == "3§")

masc_poema_7_verso_4 <- subset(masc_poema_7, verso == "4§")
feme_poema_7_verso_4 <- subset(feme_poema_7, verso == "4§")

masc_poema_7_verso_5 <- subset(masc_poema_7, verso == "5§")
feme_poema_7_verso_5 <- subset(feme_poema_7, verso == "5§")

masc_poema_7_verso_6 <- subset(masc_poema_7, verso == "6§")
feme_poema_7_verso_6 <- subset(feme_poema_7, verso == "6§")

masc_poema_7_verso_7 <- subset(masc_poema_7, verso == "7§")
feme_poema_7_verso_7 <- subset(feme_poema_7, verso == "7§")

masc_poema_7_verso_8 <- subset(masc_poema_7, verso == "8§")
feme_poema_7_verso_8 <- subset(feme_poema_7, verso == "8§")

masc_poema_7_verso_9 <- subset(masc_poema_7, verso == "9§")
feme_poema_7_verso_9 <- subset(feme_poema_7, verso == "9§")

masc_poema_7_verso_10 <- subset(masc_poema_7, verso == "10")
feme_poema_7_verso_10 <- subset(feme_poema_7, verso == "10")

masc_poema_7_verso_11 <- subset(masc_poema_7, verso == "11")
feme_poema_7_verso_11 <- subset(feme_poema_7, verso == "11")

masc_poema_7_verso_12 <- subset(masc_poema_7, verso == "12")
feme_poema_7_verso_12 <- subset(feme_poema_7, verso == "12")


m_xst_p7_v1 = mean(masc_poema_7_verso_1[,9])
m_xst_p7_v2 = mean(masc_poema_7_verso_2[,9])
m_xst_p7_v3 = mean(masc_poema_7_verso_3[,9])
m_xst_p7_v4 = mean(masc_poema_7_verso_4[,9])
m_xst_p7_v5 = mean(masc_poema_7_verso_5[,9])
m_xst_p7_v6 = mean(masc_poema_7_verso_6[,9])
m_xst_p7_v7 = mean(masc_poema_7_verso_7[,9])
m_xst_p7_v8 = mean(masc_poema_7_verso_8[,9])
m_xst_p7_v9 = mean(masc_poema_7_verso_9[,9])
m_xst_p7_v10 = mean(masc_poema_7_verso_10[,9])
m_xst_p7_v11 = mean(masc_poema_7_verso_11[,9])
m_xst_p7_v12 = mean(masc_poema_7_verso_12[,9])



# feme
f_xst_p7_v1 = mean(feme_poema_7_verso_1[,9])
f_xst_p7_v2 = mean(feme_poema_7_verso_2[,9])
f_xst_p7_v3 = mean(feme_poema_7_verso_3[,9])
f_xst_p7_v4 = mean(feme_poema_7_verso_4[,9])
f_xst_p7_v5 = mean(feme_poema_7_verso_5[,9])
f_xst_p7_v6 = mean(feme_poema_7_verso_6[,9])
f_xst_p7_v7 = mean(feme_poema_7_verso_7[,9])
f_xst_p7_v8 = mean(feme_poema_7_verso_8[,9])
f_xst_p7_v9 = mean(feme_poema_7_verso_9[,9])
f_xst_p7_v10 = mean(feme_poema_7_verso_10[,9])
f_xst_p7_v11 = mean(feme_poema_7_verso_11[,9])
f_xst_p7_v12 = mean(feme_poema_7_verso_12[,9])



masc_x_xst_p7 = c(m_xst_p7_v1, m_xst_p7_v2, m_xst_p7_v3, m_xst_p7_v4, m_xst_p7_v5, m_xst_p7_v6, m_xst_p7_v7, m_xst_p7_v8, m_xst_p7_v9, m_xst_p7_v10, m_xst_p7_v11, m_xst_p7_v12)
feme_x_xst_p7 = c(f_xst_p7_v1, f_xst_p7_v2, f_xst_p7_v3, f_xst_p7_v4, f_xst_p7_v5, f_xst_p7_v6, f_xst_p7_v7, f_xst_p7_v8, f_xst_p7_v9, f_xst_p7_v10, f_xst_p7_v11, f_xst_p7_v12)



##### DURACIÓN ####### 

# Poema 1 Rasgos
m_dur_p1_v1 = mean(masc_poema_1_verso_1[,10])
m_dur_p1_v2 = mean(masc_poema_1_verso_2[,10])
m_dur_p1_v3 = mean(masc_poema_1_verso_3[,10])
m_dur_p1_v4 = mean(masc_poema_1_verso_4[,10])
m_dur_p1_v5 = mean(masc_poema_1_verso_5[,10])
m_dur_p1_v6 = mean(masc_poema_1_verso_6[,10])
m_dur_p1_v7 = mean(masc_poema_1_verso_7[,10])
m_dur_p1_v8 = mean(masc_poema_1_verso_8[,10])
m_dur_p1_v9 = mean(masc_poema_1_verso_9[,10])


# feme
f_dur_p1_v1 = mean(feme_poema_1_verso_1[,10])
f_dur_p1_v2 = mean(feme_poema_1_verso_2[,10])
f_dur_p1_v3 = mean(feme_poema_1_verso_3[,10])
f_dur_p1_v4 = mean(feme_poema_1_verso_4[,10])
f_dur_p1_v5 = mean(feme_poema_1_verso_5[,10])
f_dur_p1_v6 = mean(feme_poema_1_verso_6[,10])
f_dur_p1_v7 = mean(feme_poema_1_verso_7[,10])
f_dur_p1_v8 = mean(feme_poema_1_verso_8[,10])
f_dur_p1_v9 = mean(feme_poema_1_verso_9[,10])




masc_x_dur_p1 = c(m_dur_p1_v1, m_dur_p1_v2, m_dur_p1_v3, m_dur_p1_v4, m_dur_p1_v5, m_dur_p1_v6, m_dur_p1_v7, m_dur_p1_v8, m_dur_p1_v9)

feme_x_dur_p1 = c(f_dur_p1_v1, f_dur_p1_v2, f_dur_p1_v3, f_dur_p1_v4, f_dur_p1_v5, f_dur_p1_v6, f_dur_p1_v7, f_dur_p1_v8, f_dur_p1_v9)


# Poema 4 Paisaje

m_dur_p4_v1 = mean(masc_poema_4_verso_1[,10])
m_dur_p4_v2 = mean(masc_poema_4_verso_2[,10])
m_dur_p4_v3 = mean(masc_poema_4_verso_3[,10])
m_dur_p4_v4 = mean(masc_poema_4_verso_4[,10])
m_dur_p4_v5 = mean(masc_poema_4_verso_5[,10])
m_dur_p4_v6 = mean(masc_poema_4_verso_6[,10])
m_dur_p4_v7 = mean(masc_poema_4_verso_7[,10])
m_dur_p4_v8 = mean(masc_poema_4_verso_8[,10])
m_dur_p4_v9 = mean(masc_poema_4_verso_9[,10])
m_dur_p4_v10 = mean(masc_poema_4_verso_10[,10])
m_dur_p4_v11 = mean(masc_poema_4_verso_11[,10])
m_dur_p4_v12 = mean(masc_poema_4_verso_12[,10])
m_dur_p4_v13 = mean(masc_poema_4_verso_13[,10])
m_dur_p4_v14 = mean(masc_poema_4_verso_14[,10])
m_dur_p4_v15 = mean(masc_poema_4_verso_15[,10])
m_dur_p4_v16 = mean(masc_poema_4_verso_16[,10])
m_dur_p4_v17 = mean(masc_poema_4_verso_17[,10])
m_dur_p4_v18 = mean(masc_poema_4_verso_18[,10])

# feme
f_dur_p4_v1 = mean(feme_poema_4_verso_1[,10])
f_dur_p4_v2 = mean(feme_poema_4_verso_2[,10])
f_dur_p4_v3 = mean(feme_poema_4_verso_3[,10])
f_dur_p4_v4 = mean(feme_poema_4_verso_4[,10])
f_dur_p4_v5 = mean(feme_poema_4_verso_5[,10])
f_dur_p4_v6 = mean(feme_poema_4_verso_6[,10])
f_dur_p4_v7 = mean(feme_poema_4_verso_7[,10])
f_dur_p4_v8 = mean(feme_poema_4_verso_8[,10])
f_dur_p4_v9 = mean(feme_poema_4_verso_9[,10])
f_dur_p4_v10 = mean(feme_poema_4_verso_10[,10])
f_dur_p4_v11 = mean(feme_poema_4_verso_11[,10])
f_dur_p4_v12 = mean(feme_poema_4_verso_12[,10])
f_dur_p4_v13 = mean(feme_poema_4_verso_13[,10])
f_dur_p4_v14 = mean(feme_poema_4_verso_14[,10])
f_dur_p4_v15 = mean(feme_poema_4_verso_15[,10])
f_dur_p4_v16 = mean(feme_poema_4_verso_16[,10])
f_dur_p4_v17 = mean(feme_poema_4_verso_17[,10])
f_dur_p4_v18 = mean(feme_poema_4_verso_18[,10])


masc_x_dur_p4 = c(m_dur_p4_v1, m_dur_p4_v2, m_dur_p4_v3, m_dur_p4_v4, m_dur_p4_v5, m_dur_p4_v6, m_dur_p4_v7, m_dur_p4_v8, m_dur_p4_v9, m_dur_p4_v10, m_dur_p4_v11, m_dur_p4_v12, m_dur_p4_v13, m_dur_p4_v14, m_dur_p4_v15, m_dur_p4_v16, m_dur_p4_v17, m_dur_p4_v18)

feme_x_dur_p4 = c(f_dur_p4_v1, f_dur_p4_v2, f_dur_p4_v3, f_dur_p4_v4, f_dur_p4_v5, f_dur_p4_v6, f_dur_p4_v7, f_dur_p4_v8, f_dur_p4_v9, f_dur_p4_v10, f_dur_p4_v11, f_dur_p4_v12, f_dur_p4_v13, f_dur_p4_v14, f_dur_p4_v15, f_dur_p4_v16, f_dur_p4_v17, f_dur_p4_v18)



# Poema 7 Romance sonambulo

m_dur_p7_v1 = mean(masc_poema_7_verso_1[,10])
m_dur_p7_v2 = mean(masc_poema_7_verso_2[,10])
m_dur_p7_v3 = mean(masc_poema_7_verso_3[,10])
m_dur_p7_v4 = mean(masc_poema_7_verso_4[,10])
m_dur_p7_v5 = mean(masc_poema_7_verso_5[,10])
m_dur_p7_v6 = mean(masc_poema_7_verso_6[,10])
m_dur_p7_v7 = mean(masc_poema_7_verso_7[,10])
m_dur_p7_v8 = mean(masc_poema_7_verso_8[,10])
m_dur_p7_v9 = mean(masc_poema_7_verso_9[,10])
m_dur_p7_v10 = mean(masc_poema_7_verso_10[,10])
m_dur_p7_v11 = mean(masc_poema_7_verso_11[,10])
m_dur_p7_v12 = mean(masc_poema_7_verso_12[,10])


# feme
f_dur_p7_v1 = mean(feme_poema_7_verso_1[,10])
f_dur_p7_v2 = mean(feme_poema_7_verso_2[,10])
f_dur_p7_v3 = mean(feme_poema_7_verso_3[,10])
f_dur_p7_v4 = mean(feme_poema_7_verso_4[,10])
f_dur_p7_v5 = mean(feme_poema_7_verso_5[,10])
f_dur_p7_v6 = mean(feme_poema_7_verso_6[,10])
f_dur_p7_v7 = mean(feme_poema_7_verso_7[,10])
f_dur_p7_v8 = mean(feme_poema_7_verso_8[,10])
f_dur_p7_v9 = mean(feme_poema_7_verso_9[,10])
f_dur_p7_v10 = mean(feme_poema_7_verso_10[,10])
f_dur_p7_v11 = mean(feme_poema_7_verso_11[,10])
f_dur_p7_v12 = mean(feme_poema_7_verso_12[,10])



masc_x_dur_p7 = c(m_dur_p7_v1, m_dur_p7_v2, m_dur_p7_v3, m_dur_p7_v4, m_dur_p7_v5, m_dur_p7_v6, m_dur_p7_v7, m_dur_p7_v8, m_dur_p7_v9, m_dur_p7_v10, m_dur_p7_v11, m_dur_p7_v12)

feme_x_dur_p7 = c(f_dur_p7_v1, f_dur_p7_v2, f_dur_p7_v3, f_dur_p7_v4, f_dur_p7_v5, f_dur_p7_v6, f_dur_p7_v7, f_dur_p7_v8, f_dur_p7_v9, f_dur_p7_v10, f_dur_p7_v11, f_dur_p7_v12)


# 11 velocidad

# Poema 1

m_veloc_p1_v1 = mean(masc_poema_1_verso_1[,11])
m_veloc_p1_v2 = mean(masc_poema_1_verso_2[,11])
m_veloc_p1_v3 = mean(masc_poema_1_verso_3[,11])
m_veloc_p1_v4 = mean(masc_poema_1_verso_4[,11])
m_veloc_p1_v5 = mean(masc_poema_1_verso_5[,11])
m_veloc_p1_v6 = mean(masc_poema_1_verso_6[,11])
m_veloc_p1_v7 = mean(masc_poema_1_verso_7[,11])
m_veloc_p1_v8 = mean(masc_poema_1_verso_8[,11])
m_veloc_p1_v9 = mean(masc_poema_1_verso_9[,11])


# feme
f_veloc_p1_v1 = mean(feme_poema_1_verso_1[,11])
f_veloc_p1_v2 = mean(feme_poema_1_verso_2[,11])
f_veloc_p1_v3 = mean(feme_poema_1_verso_3[,11])
f_veloc_p1_v4 = mean(feme_poema_1_verso_4[,11])
f_veloc_p1_v5 = mean(feme_poema_1_verso_5[,11])
f_veloc_p1_v6 = mean(feme_poema_1_verso_6[,11])
f_veloc_p1_v7 = mean(feme_poema_1_verso_7[,11])
f_veloc_p1_v8 = mean(feme_poema_1_verso_8[,11])
f_veloc_p1_v9 = mean(feme_poema_1_verso_9[,11])

masc_x_veloc_p1 = c(m_veloc_p1_v1, m_veloc_p1_v2, m_veloc_p1_v3, m_veloc_p1_v4, m_veloc_p1_v5, m_veloc_p1_v6, m_veloc_p1_v7, m_veloc_p1_v8, m_veloc_p1_v9 )

feme_x_veloc_p1 = c(f_veloc_p1_v1, f_veloc_p1_v2, f_veloc_p1_v3, f_veloc_p1_v4, f_veloc_p1_v5, f_veloc_p1_v6, f_veloc_p1_v7, f_veloc_p1_v8, f_veloc_p1_v9 )


# velocidad poema 4

m_veloc_p4_v1 = mean(masc_poema_4_verso_1[,11])
m_veloc_p4_v2 = mean(masc_poema_4_verso_2[,11])
m_veloc_p4_v3 = mean(masc_poema_4_verso_3[,11])
m_veloc_p4_v4 = mean(masc_poema_4_verso_4[,11])
m_veloc_p4_v5 = mean(masc_poema_4_verso_5[,11])
m_veloc_p4_v6 = mean(masc_poema_4_verso_6[,11])
m_veloc_p4_v7 = mean(masc_poema_4_verso_7[,11])
m_veloc_p4_v8 = mean(masc_poema_4_verso_8[,11])
m_veloc_p4_v9 = mean(masc_poema_4_verso_9[,11])
m_veloc_p4_v10 = mean(masc_poema_4_verso_10[,11])
m_veloc_p4_v11 = mean(masc_poema_4_verso_11[,11])
m_veloc_p4_v12 = mean(masc_poema_4_verso_12[,11])
m_veloc_p4_v13 = mean(masc_poema_4_verso_13[,11])
m_veloc_p4_v14 = mean(masc_poema_4_verso_14[,11])
m_veloc_p4_v15 = mean(masc_poema_4_verso_15[,11])
m_veloc_p4_v16 = mean(masc_poema_4_verso_16[,11])
m_veloc_p4_v17 = mean(masc_poema_4_verso_17[,11])
m_veloc_p4_v18 = mean(masc_poema_4_verso_18[,11])


# feme
f_veloc_p4_v1 = mean(feme_poema_4_verso_1[,11])
f_veloc_p4_v2 = mean(feme_poema_4_verso_2[,11])
f_veloc_p4_v3 = mean(feme_poema_4_verso_3[,11])
f_veloc_p4_v4 = mean(feme_poema_4_verso_4[,11])
f_veloc_p4_v5 = mean(feme_poema_4_verso_5[,11])
f_veloc_p4_v6 = mean(feme_poema_4_verso_6[,11])
f_veloc_p4_v7 = mean(feme_poema_4_verso_7[,11])
f_veloc_p4_v8 = mean(feme_poema_4_verso_8[,11])
f_veloc_p4_v9 = mean(feme_poema_4_verso_9[,11])
f_veloc_p4_v10 = mean(feme_poema_4_verso_10[,11])
f_veloc_p4_v11 = mean(feme_poema_4_verso_11[,11])
f_veloc_p4_v12 = mean(feme_poema_4_verso_12[,11])
f_veloc_p4_v13 = mean(feme_poema_4_verso_13[,11])
f_veloc_p4_v14 = mean(feme_poema_4_verso_14[,11])
f_veloc_p4_v15 = mean(feme_poema_4_verso_15[,11])
f_veloc_p4_v16 = mean(feme_poema_4_verso_16[,11])
f_veloc_p4_v17 = mean(feme_poema_4_verso_17[,11])
f_veloc_p4_v18 = mean(feme_poema_4_verso_18[,11])


masc_x_veloc_p4 = c(m_veloc_p4_v1, m_veloc_p4_v2, m_veloc_p4_v3, m_veloc_p4_v4, m_veloc_p4_v5, m_veloc_p4_v6, m_veloc_p4_v7, m_veloc_p4_v8, m_veloc_p4_v9, m_veloc_p4_v10, m_veloc_p4_v11, m_veloc_p4_v12,m_veloc_p4_v13, m_veloc_p4_v14, m_veloc_p4_v15, m_veloc_p4_v16, m_veloc_p4_v17, m_veloc_p4_v18)

feme_x_veloc_p4 = c(f_veloc_p4_v1, f_veloc_p4_v2, f_veloc_p4_v3, f_veloc_p4_v4, f_veloc_p4_v5, f_veloc_p4_v6, f_veloc_p4_v7, f_veloc_p4_v8, f_veloc_p4_v9, f_veloc_p4_v10, f_veloc_p4_v11, f_veloc_p4_v12, f_veloc_p4_v13, f_veloc_p4_v14, f_veloc_p4_v15, f_veloc_p4_v16, f_veloc_p4_v17, f_veloc_p4_v18)



# poema 7

m_veloc_p7_v1 = mean(masc_poema_7_verso_1[,11])
m_veloc_p7_v2 = mean(masc_poema_7_verso_2[,11])
m_veloc_p7_v3 = mean(masc_poema_7_verso_3[,11])
m_veloc_p7_v4 = mean(masc_poema_7_verso_4[,11])
m_veloc_p7_v5 = mean(masc_poema_7_verso_5[,11])
m_veloc_p7_v6 = mean(masc_poema_7_verso_6[,11])
m_veloc_p7_v7 = mean(masc_poema_7_verso_7[,11])
m_veloc_p7_v8 = mean(masc_poema_7_verso_8[,11])
m_veloc_p7_v9 = mean(masc_poema_7_verso_9[,11])
m_veloc_p7_v10 = mean(masc_poema_7_verso_10[,11])
m_veloc_p7_v11 = mean(masc_poema_7_verso_11[,11])
m_veloc_p7_v12 = mean(masc_poema_7_verso_12[,11])


# feme
f_veloc_p7_v1 = mean(feme_poema_7_verso_1[,11])
f_veloc_p7_v2 = mean(feme_poema_7_verso_2[,11])
f_veloc_p7_v3 = mean(feme_poema_7_verso_3[,11])
f_veloc_p7_v4 = mean(feme_poema_7_verso_4[,11])
f_veloc_p7_v5 = mean(feme_poema_7_verso_5[,11])
f_veloc_p7_v6 = mean(feme_poema_7_verso_6[,11])
f_veloc_p7_v7 = mean(feme_poema_7_verso_7[,11])
f_veloc_p7_v8 = mean(feme_poema_7_verso_8[,11])
f_veloc_p7_v9 = mean(feme_poema_7_verso_9[,11])
f_veloc_p7_v10 = mean(feme_poema_7_verso_10[,11])
f_veloc_p7_v11 = mean(feme_poema_7_verso_11[,11])
f_veloc_p7_v12 = mean(feme_poema_7_verso_12[,11])


masc_x_veloc_p7 = c(m_veloc_p7_v1, m_veloc_p7_v2, m_veloc_p7_v3, m_veloc_p7_v4, m_veloc_p7_v5, m_veloc_p7_v6, m_veloc_p7_v7, m_veloc_p7_v8, m_veloc_p7_v9, m_veloc_p7_v10, m_veloc_p7_v11, m_veloc_p7_v12 )

feme_x_veloc_p7 = c(f_veloc_p7_v1, f_veloc_p7_v2, f_veloc_p7_v3, f_veloc_p7_v4, f_veloc_p7_v5, f_veloc_p7_v6, f_veloc_p7_v7, f_veloc_p7_v8, f_veloc_p7_v9, f_veloc_p7_v10,f_veloc_p7_v11,f_veloc_p7_v12 )



# 12 Pendiente

m_pend_p1_v1 = mean(masc_poema_1_verso_1[,12])
m_pend_p1_v2 = mean(masc_poema_1_verso_2[,12])
m_pend_p1_v3 = mean(masc_poema_1_verso_3[,12])
m_pend_p1_v4 = mean(masc_poema_1_verso_4[,12])
m_pend_p1_v5 = mean(masc_poema_1_verso_5[,12])
m_pend_p1_v6 = mean(masc_poema_1_verso_6[,12])
m_pend_p1_v7 = mean(masc_poema_1_verso_7[,12])
m_pend_p1_v8 = mean(masc_poema_1_verso_8[,12])
m_pend_p1_v9 = mean(masc_poema_1_verso_9[,12])


# feme
f_pend_p1_v1 = mean(feme_poema_1_verso_1[,12])
f_pend_p1_v2 = mean(feme_poema_1_verso_2[,12])
f_pend_p1_v3 = mean(feme_poema_1_verso_3[,12])
f_pend_p1_v4 = mean(feme_poema_1_verso_4[,12])
f_pend_p1_v5 = mean(feme_poema_1_verso_5[,12])
f_pend_p1_v6 = mean(feme_poema_1_verso_6[,12])
f_pend_p1_v7 = mean(feme_poema_1_verso_7[,12])
f_pend_p1_v8 = mean(feme_poema_1_verso_8[,12])
f_pend_p1_v9 = mean(feme_poema_1_verso_9[,12])

masc_x_pend_p1 = c(m_pend_p1_v1, m_pend_p1_v2, m_pend_p1_v3, m_pend_p1_v4, m_pend_p1_v5, m_pend_p1_v6, m_pend_p1_v7, m_pend_p1_v8, m_pend_p1_v9 )

feme_x_pend_p1 = c(f_pend_p1_v1, f_pend_p1_v2, f_pend_p1_v3, f_pend_p1_v4, f_pend_p1_v5, f_pend_p1_v6, f_pend_p1_v7, f_pend_p1_v8, f_pend_p1_v9 )



# Poema 4

m_pend_p4_v1 = mean(masc_poema_4_verso_1[,12])
m_pend_p4_v2 = mean(masc_poema_4_verso_2[,12])
m_pend_p4_v3 = mean(masc_poema_4_verso_3[,12])
m_pend_p4_v4 = mean(masc_poema_4_verso_4[,12])
m_pend_p4_v5 = mean(masc_poema_4_verso_5[,12])
m_pend_p4_v6 = mean(masc_poema_4_verso_6[,12])
m_pend_p4_v7 = mean(masc_poema_4_verso_7[,12])
m_pend_p4_v8 = mean(masc_poema_4_verso_8[,12])
m_pend_p4_v9 = mean(masc_poema_4_verso_9[,12])
m_pend_p4_v10 = mean(masc_poema_4_verso_10[,12])
m_pend_p4_v11 = mean(masc_poema_4_verso_11[,12])
m_pend_p4_v12 = mean(masc_poema_4_verso_12[,12])
m_pend_p4_v13 = mean(masc_poema_4_verso_13[,12])
m_pend_p4_v14 = mean(masc_poema_4_verso_14[,12])
m_pend_p4_v15 = mean(masc_poema_4_verso_15[,12])
m_pend_p4_v16 = mean(masc_poema_4_verso_16[,12])
m_pend_p4_v17 = mean(masc_poema_4_verso_17[,12])
m_pend_p4_v18 = mean(masc_poema_4_verso_18[,12])


# feme
f_pend_p4_v1 = mean(feme_poema_4_verso_1[,12])
f_pend_p4_v2 = mean(feme_poema_4_verso_2[,12])
f_pend_p4_v3 = mean(feme_poema_4_verso_3[,12])
f_pend_p4_v4 = mean(feme_poema_4_verso_4[,12])
f_pend_p4_v5 = mean(feme_poema_4_verso_5[,12])
f_pend_p4_v6 = mean(feme_poema_4_verso_6[,12])
f_pend_p4_v7 = mean(feme_poema_4_verso_7[,12])
f_pend_p4_v8 = mean(feme_poema_4_verso_8[,12])
f_pend_p4_v9 = mean(feme_poema_4_verso_9[,12])
f_pend_p4_v10 = mean(feme_poema_4_verso_10[,12])
f_pend_p4_v11 = mean(feme_poema_4_verso_11[,12])
f_pend_p4_v12 = mean(feme_poema_4_verso_12[,12])
f_pend_p4_v13 = mean(feme_poema_4_verso_13[,12])
f_pend_p4_v14 = mean(feme_poema_4_verso_14[,12])
f_pend_p4_v15 = mean(feme_poema_4_verso_15[,12])
f_pend_p4_v16 = mean(feme_poema_4_verso_16[,12])
f_pend_p4_v17 = mean(feme_poema_4_verso_17[,12])
f_pend_p4_v18 = mean(feme_poema_4_verso_18[,12])



masc_x_pend_p4 = c(m_pend_p4_v1, m_pend_p4_v2, m_pend_p4_v3, m_pend_p4_v4, m_pend_p4_v5, m_pend_p4_v6, m_pend_p4_v7, m_pend_p4_v8, m_pend_p4_v9, m_pend_p4_v10, m_pend_p4_v11, m_pend_p4_v12,m_pend_p4_v13, m_pend_p4_v14, m_pend_p4_v15, m_pend_p4_v16, m_pend_p4_v17, m_pend_p4_v18)

feme_x_pend_p4 = c(f_pend_p4_v1, f_pend_p4_v2, f_pend_p4_v3, f_pend_p4_v4, f_pend_p4_v5, f_pend_p4_v6, f_pend_p4_v7, f_pend_p4_v8, f_pend_p4_v9, f_pend_p4_v10, f_pend_p4_v11, f_pend_p4_v12, f_pend_p4_v13, f_pend_p4_v14, f_pend_p4_v15, f_pend_p4_v16, f_pend_p4_v17, f_pend_p4_v18)


# poema 7

m_pend_p7_v1 = mean(masc_poema_7_verso_1[,12])
m_pend_p7_v2 = mean(masc_poema_7_verso_2[,12])
m_pend_p7_v3 = mean(masc_poema_7_verso_3[,12])
m_pend_p7_v4 = mean(masc_poema_7_verso_4[,12])
m_pend_p7_v5 = mean(masc_poema_7_verso_5[,12])
m_pend_p7_v6 = mean(masc_poema_7_verso_6[,12])
m_pend_p7_v7 = mean(masc_poema_7_verso_7[,12])
m_pend_p7_v8 = mean(masc_poema_7_verso_8[,12])
m_pend_p7_v9 = mean(masc_poema_7_verso_9[,12])
m_pend_p7_v10 = mean(masc_poema_7_verso_10[,12])
m_pend_p7_v11 = mean(masc_poema_7_verso_11[,12])
m_pend_p7_v12 = mean(masc_poema_7_verso_12[,12])


# feme
f_pend_p7_v1 = mean(feme_poema_7_verso_1[,12])
f_pend_p7_v2 = mean(feme_poema_7_verso_2[,12])
f_pend_p7_v3 = mean(feme_poema_7_verso_3[,12])
f_pend_p7_v4 = mean(feme_poema_7_verso_4[,12])
f_pend_p7_v5 = mean(feme_poema_7_verso_5[,12])
f_pend_p7_v6 = mean(feme_poema_7_verso_6[,12])
f_pend_p7_v7 = mean(feme_poema_7_verso_7[,12])
f_pend_p7_v8 = mean(feme_poema_7_verso_8[,12])
f_pend_p7_v9 = mean(feme_poema_7_verso_9[,12])
f_pend_p7_v10 = mean(feme_poema_7_verso_10[,12])
f_pend_p7_v11 = mean(feme_poema_7_verso_11[,12])
f_pend_p7_v12 = mean(feme_poema_7_verso_12[,12])


masc_x_pend_p7 = c(m_pend_p7_v1, m_pend_p7_v2, m_pend_p7_v3, m_pend_p7_v4, m_pend_p7_v5, m_pend_p7_v6, m_pend_p7_v7, m_pend_p7_v8, m_pend_p7_v9, m_pend_p7_v10, m_pend_p7_v11, m_pend_p7_v12)

feme_x_pend_p7 = c(f_pend_p7_v1, f_pend_p7_v2, f_pend_p7_v3, f_pend_p7_v4, f_pend_p7_v5, f_pend_p7_v6, f_pend_p7_v7, f_pend_p7_v8, f_pend_p7_v9, f_pend_p7_v10, f_pend_p7_v11, f_pend_p7_v12)







################################################
######## GRÁFICOS ########
################################################


# Estos comandos en R guardan el gráfico inmediatamente en el direcctorio de trabajo
# con el nombre que está en el paréntesis entre comillas. El nombre del primer gráfico es "st_poema 1.png"
# Si ejecutas desde png... hasta dev.off, o sea el bloque completo, el gráfico se guarda 
# con ese nombre con el formato png y ancho y alto establecidos
# en cambio, si ejecutas solo desde par... hasta la penúltima línea de este bloque, verás el gráfico en R 
# pero no está guardado.

png("st_poema 1.png", width = 600, height = 600)   # Nombre del archivo y dimensiones)  
par(mfrow=c(1,1))
plot(masc_x_xst_p1, col = "blue", ylim= c(1, 6), ylab="", type = "b", main = "Amplitud tonal por verso poema Rasgos",xlab="", pch=15)
axis(1, at = c(1:9))
par(new=TRUE)
plot(feme_x_xst_p1, col ="red", ylim= c(1, 6), type = "b", ylab= "st", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))  
dev.off()


png("st_poema_4.png",  width = 600, height = 600)
par(mfrow=c(1,1))
plot(masc_x_xst_p4, col = "blue", ylim= c(1, 10), ylab="", type = "b", main = "Amplitud tonal por verso poema Paisaje",xlab="", pch=15)
axis(1, at = c(1:18))
par(new=TRUE)
plot(feme_x_xst_p4, col ="red", ylim= c(1, 10), type = "b", ylab= "st", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))  
dev.off()

png("st_poema_7.png",  width = 600, height = 600)
par(mfrow=c(1,1))
plot(masc_x_xst_p7, col = "blue", ylim= c(1, 12), ylab="", type = "b", main = "Amplitud tonal por verso poema R. sonámbulo",xlab="", pch=15)
axis(1, at = c(1:12))
par(new=TRUE)
plot(feme_x_xst_p7, col ="red",  ylim= c(1, 12), type = "b", ylab= "st", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))  
dev.off()

png("dur_poema_1.png",  width = 600, height = 600)
par(mfrow=c(1,1))
plot(masc_x_dur_p1, ylim=c(0.6,1.2), col = "blue", ylab="", type = "b", main = "Duración por verso poema Rasgos",xlab="", pch=15)
axis(1, at = c(1:18))
par(new=TRUE)
plot(feme_x_dur_p1,ylim=c(0.6,1.2), col ="red", type = "b", ylab= "Segundos", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))  
dev.off()

png("dur_poema_4.png",  width = 600, height = 600)
par(mfrow=c(1,1))
plot(masc_x_dur_p4, ylim=c(0.5,2.5), col = "blue", ylab="", type = "b", main = "Duración cada verso poema Paisaje",xlab="", pch=15)
axis(1, at = c(1:18))
par(new=TRUE)
plot(feme_x_dur_p4,ylim=c(0.5,2.5), col ="red", type = "b", ylab= "Segundos", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))  
dev.off()

png("dur_poema_7.png",  width = 600, height = 600)
par(mfrow=c(1,1))
plot(masc_x_dur_p7, ylim=c(1,3.3), col = "blue", ylab="", type = "b", main = "Duración por verso poema R. sonámbulo",xlab="", pch=15)
axis(1, at = c(1:12))
par(new=TRUE)
plot(feme_x_dur_p7,ylim=c(1,3.3), col ="red", type = "b", ylab= "Segundos", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))  
dev.off()

png("vel_poema_1.png",  width = 600, height = 600)
par(mfrow=c(1,1))
plot(masc_x_veloc_p1, col = "blue", ylim= c(2, 7), ylab="", type = "b", main = "Velocidad por verso poema Rasgos",xlab="", pch=15)
axis(1, at = c(1:9))
par(new = TRUE)
plot(feme_x_veloc_p1, col ="red", ylim= c(2, 7), type = "b", ylab= "sílabas/segundo", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))
dev.off()

png("vel_poema_4.png",  width = 600, height = 600)
par(mfrow=c(1,1))
plot(masc_x_veloc_p4, col = "blue", ylim= c(3, 7.3), ylab="", type = "b", main = "Velocidad por verso poema Paisaje",xlab="", pch=15)
axis(1, at = c(1:18))
par(new=TRUE)
plot(feme_x_veloc_p4, col ="red", ylim= c(3, 7.3), type = "b", ylab= "sílabas/segundo", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))  
dev.off()

png("vel_poema_7.png",  width = 600, height = 600)
par(mfrow=c(1,1))
plot(masc_x_veloc_p7, col = "blue", ylim= c(2.8, 7), ylab="", type = "b", main = "velocidad por verso poema R. sonámbulo",xlab="", pch=15)
axis(1, at = c(1:12))
par(new=TRUE)
plot(feme_x_veloc_p7, col ="red", ylim= c(2.8,7), type = "b", ylab= "sílabas/segundo", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))  
dev.off()

png("pend_poema_1.png",  width = 600, height = 600)
par(mfrow=c(1,1))
plot(masc_x_pend_p1, col = "blue", ylim= c(-6.2,2), ylab="", type = "b", main = "Pendiente por verso poema Rasgos",xlab="", pch=15)
axis(1, at = c(1:9))
par(new = TRUE)
plot(feme_x_pend_p1, col ="red", ylim= c(-6.2, 2), type = "b", ylab= "st/segundo", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))
dev.off()

png("pend_poema_4.png",  width = 600, height = 600)
par(mfrow=c(1,1))
plot(masc_x_pend_p4, col = "blue", ylim = c( -7.5,7.5), ylab="", type = "b", main = "Pendiente por verso poema Paisaje",xlab="", pch=15)
axis(1, at = c(1:18))
par(new=TRUE)
plot(feme_x_pend_p4, col ="red", ylim = c( -7.5,7.5), type = "b", ylab= "st/segundo", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))  
dev.off()

png("pend_poema_7.png",  width = 600, height = 600)
par(mfrow=c(1,1))
plot(masc_x_pend_p7, col = "blue", ylim = c( -6.5,3.5), ylab="", type = "b", main = "Pendiente por verso poema R. sonámbulo",xlab="", pch=15)
axis(1, at = c(1:12))
par(new=TRUE)
plot(feme_x_pend_p7, col ="red", ylim= c(-6.5,3.5), type = "b", ylab= "st/segundo", xlab="Versos", pch=16)
grid()
legend(x = "topright", legend= c("Hombres", "Mujeres"), col= c("blue", "red"), pch=c(15,16))  
dev.off()


