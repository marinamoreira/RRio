## Day 2 of R workshop
### by Andrew and Alathea

##é bom dizer logo no inicio que pacotes usei
# para criar isso coloco clicar em code, insert section 

# load packages -----------------------------------------------------------

library(ggplot2)

# load functions ----------------------------------------------------------
#como carregar as funções que criamos
#para carregarmos coisas que estão em uma categoria acima do arquivo que estamos trabalhando usa-se ../

source("scrips/functions.R")

# load gapminder ----------------------------------------------------------

gapminder <- read.csv("data/gapminder.csv", header=TRUE)

# subsetting review -------------------------------------------------------
#methods of subsetting
# x[a] for vectors

x <- c(10:1)
x
x[3]

# x[a,b] matrices, data.frames not lists

# x["a"] or x["a",] for vector, data frame or matrix
x <- c(1:10)
names(x) <- letters[1:10]
x
x["b"]

#x[[a]] for lists and data frame
x <- list(c(1:10), c(10:20))
x
x[[1]]

# x$a 
names(x) <- c("one", "two")
x
x$two

## more complex subsetting 
#>,<, == 
gapminder[gapminder$country == "Brazil",]# não esquecer de colocar a vírgula. 
x <- c(1:10)
x
x>7
x[x>7]
x[x<3]

#%in%

x <- c(1:10)
names(x) <- letters[1:10]
x
# this doesn't work, so we can use the function %in%
x== c("d","e","f")

# para seleconar numeros em um conjunto de dados
x[x%in% c(4,5,6)]

# para selecionar os nomes em um conjunto de dados
x[names(x) %in% c("d", "e", "f")]

## challenge
gapminder[gapminder$year == 1957,]
gapminder[,-c(1:4)]
gapminder[gapminder$lifeExp > 80, ]
gapminder[1, c(4:5)]
gapminder[gapminder$year == 2002|2007,]#errado

g1 <- gapminder[gapminder$year == 2002,]
g2 <- gapminder[gapminder$year == 2007,]
rbind(g1, g2)

gapminder$year == 2002
gapminder$year == 2007
gm2 <- gapminder[gapminder$year == 2002 | gapminder$year == 2007,]
gm3 <- gapminder[gapminder$year %in% c(2002, 2007),]
gm3

##prefix #todas as funções abaixo dizem a mesma coisa
sum(2,3)
##infix
2+3
##infix como um prefix
'+'(2,3)


# plotting review ---------------------------------------------------------
#colour by continent
ggplot(data= gapminder, aes(x = lifeExp, y = gdpPercap, colour = continent))+
  geom_point()
ggplot(data= gapminder, aes(x = year, y = pop, colour = continent))+
  geom_point()

##population
ggplot(data= gapminder, aes(x = year, y = pop, colour = continent, group = country))+
  geom_line()+
  geom_point(colour = "black")+
  scale_y_log10()

##spliT UP BY continent
ggplot(data= gapminder, aes(x = year, y = pop, colour = continent, group = country))+
  geom_line()+
  geom_point(colour = "black")+
  scale_y_log10()+
  facet_wrap(~continent)

#exemple # a função alpha faz com que os pontos fiquem transparentes
ggplot(data= gapminder, aes(x = lifeExp, y = gdpPercap))+
  geom_point(colour = "blue", size = 3.0, alpha = 0.1)+
  scale_y_log10()+
    geom_smooth(method ="lm", size= 1.5, colour = "red")

str(gapminder)

##density plot# tem uma página no internet que mostra algumas opções de como fazer esse scripts

ggplot(data= gapminder, aes(x =gdpPercap, fill= continent))+
  geom_density(alpha=0.2)+
  facet_wrap(~year)+
  scale_x_log10()+
  theme_bw()+
  ggtitle("GDP density")+
  ylab("Density of PIB")+
  xlab("PIB")+
  scale_fill_manual(values = c("red", "yellow", "blue", "green"))
  labs(fill= "continente")#outra forma de escrever isso é scale_fill_manual(values = c(guide ="parte do mundo")
  
  
  
  
?geom_density
?stat_density

# parte da tarde ----------------------------------------------------------


# how to save the plot ----------------------------------------------------

ggsave("figures/dansity.pdf")
  
ggsave("figures/dansity.jpg")
# pode se salvar do plot clicando no export

pdf(file = "figures/pdf_density_plot.pdf", height = 7)
ggplot(data= gapminder, aes(x =gdpPercap, fill= continent))+
  geom_density(alpha=0.2)+
  facet_wrap(~year)+
  scale_x_log10()+
  theme_bw()+
  ggtitle("GDP density")+
  ylab("Density of PIB")+
  xlab("PIB")+
  scale_fill_manual(values = c("red", "yellow", "blue", "green"))
dev.off()

#challenge - plotndo dois gráficos um em cada página diferente

pdf(file="figures/multiple.pdf", height=8)
ggplot(data= gapminder, aes(x =gdpPercap, fill= continent))+
  geom_density(alpha=0.2)+
  scale_x_log10()+
  theme_bw()+
  ggtitle("GDP density")+
  ylab("Density of PIB")+
  xlab("PIB")+
  scale_fill_manual(values = c("red", "yellow", "blue", "green", "pink"))

ggplot(data= gapminder, aes(x =gdpPercap, fill= continent))+
  geom_density(alpha=0.2)+
  scale_x_log10()+
  theme_bw()+
  ggtitle("GDP density")+
  ylab("Density of PIB")+
  xlab("PIB")+
  scale_fill_manual(values = c("red", "yellow", "blue", "green","pink"))+facet_grid(~continent)
dev.off()

#png
png(file="figures/png_multiple.png", height=8)
ggplot(data= gapminder, aes(x =gdpPercap, fill= continent))+
  geom_density(alpha=0.2)+
  scale_x_log10()+
  theme_bw()+
  ggtitle("GDP density")+
  ylab("Density of PIB")+
  xlab("PIB")+
  scale_fill_manual(values = c("red", "yellow", "blue", "green", "pink"))
dev.off()
# se colocar ?jpeg ou outro tipo de gráfico vai aparecer um help com ajuda para fazer gráficos de vários tipos

## multiple
##grid.arrange
###gridExtra:: grid.arrange()

# Working with data frames ------------------------------------------------

#rbind and cbind can add rows and columns to data frames
iris
head(iris)

#add a new columns

iris$Family <- "Iridaceae"
head(iris)

#add a column using data from the data frame - esta função é muito importante!!!
iris$Petal.Area <- iris$Sepal.Width*iris$Sepal.Length
head(iris)
# ao inves de ficar repetindo a todo o momento iris$ podemos usar a função with.
iris$Sepal.Area <- with(iris, Sepal.Width *Sepal.Length)
head(iris)

# summary stats

mean(iris$Petal.Width)
sd(iris$Sepal.Width)
median(iris$Sepal.Width)
mean_petal_width <- mean(iris$Petal.Width)
sd_petal_width <- sd(iris$Petal.Width)
sd_petal_width/mean_petal_width #coeficiente de variação

#challenge

mean_sepal <- mean(iris$Sepal.Length)
sd_sepal <- sd(iris$Sepal.Length)
sd_sepal/mean_sepal


# R functions -------------------------------------------------------------

cal_CV(iris$Sepal.Length)
cal_CV(iris$Sepal.Width)
cal_CV(iris$Petal.Area)

##area of circle
circum_to_diameter(30)
circum_to_diameter(3)
radiuns_to_diam(9.54)
radius_to_area(2)
area_from_circum(40)

##make a data.frame
circs <- data.frame(xs = 10:200)
head(circs)
#adicionando mais uma coluna no meu data.frame
circs$areas <- area_from_circum(circum = circs$xs)
head(circs)

ggplot(circs, aes(x= xs, y = areas))+
  geom_line ()

# Saving data -------------------------------------------------------------

brazil <- gapminder[gapminder$country == "Brazil",]
brazil

write.table(x = brazil, file = "cleaned data/brazil.csv", 
            sep=",",
            row.names =FALSE,
            quote = FALSE)

write.table(x = brazil, file = "cleaned data/brazil2.csv", 
            sep="\t",
            row.names =FALSE,
            quote = FALSE)

write.table(x = brazil, file = "cleaned data/brazil3.csv", 
            sep=";",
            row.names =FALSE,
            quote = FALSE)#QUOTE RETIRA AS "" DOS NOMES

brazil2 <- read.table("cleaned data/brazil_data_tabbed")

##Challenge

ano <- gapminder[gapminder$year>=1990,]
ano
write.table(x=ano, file ="cleaned data/1990.csv",
            sep=",",
            row.names=FALSE,
            quote =FALSE)
