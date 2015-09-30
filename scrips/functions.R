###Functions
### for analyzing gapminder data
### Andrew 
###September

# criando uma função para cv (coeficiente de variação), function, cria a função o x é o argumento
#takes a vector of numbers
#returns the cv

cal_CV <- function(x){
  mean_x <- mean(x)
  sd_x <- sd(x)
  CV <- sd_x/mean_x
  return(CV)
}

name <- function(variables){}

##go from circumference to diameter
#para escrever uma função o bom é pensar qual o dado que eu tenho e o que eu quero dele.

circum_to_diameter <- function(circ){
  diam <- circ/pi
  return(diam)
}

## Challenge: write a function that calculates the radius from the diameter
#calculate the diameter of a circle from the radius

radiuns_to_diam<-function (diam){
  radius<- diam/2
  return(radius)
}

##calculate the area from the radius
radius_to_area <- function(radius){
  area <- pi*radius^2
  return(area)
}

## Para fazer a função de baixo rodar temos que ter cuidado para não errar nos nomes abaixo, eles devem ser iguais ao das funções rodadas acima
##start with circumference and get the area
area_from_circum <- function (circum){
## get the diameter from circunference
diam <- circum_to_diameter (circum)
## get the radius
rad <- radiuns_to_diam(diam) 
## calculate area from radiun 
Area <- radius_to_area (rad)
return(Area)
}

