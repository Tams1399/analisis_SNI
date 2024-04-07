# cargar paquetes
pacman::p_load( "vroom", "dplyr" )

# leer la data
la_data <- vroom( file = "data/data_original.csv" )

#nos quedamos solo con DR. y DRA.
data_filtrada <- la_data %>% 
  filter( nobilis == "DR." | nobilis == "DRA." )

# creamos un directorio de resultados
dir.create( path = "results" )

# guardar esta data 
write.csv( x = data_filtrada, file = "results/limpia.csv" )

# calcular la proporcion de Dr y Dra que pierden el SNI
data_resumen <- data_filtrada %>% 
  filter( cambio == "perdio SNI" ) %>% 
  group_by( nobilis ) %>%
  summarise( totales = sum(miembros))

#Guardamos la data resumen
write.csv(x=data_resumen, file= "results/resumen.csv")

#To-DOs
#Tania: calcular el % de Dr y Dra que pierde SNI
#       como total de ingresos / total perdidas

