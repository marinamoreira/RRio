#R course in Rio 
# by Andrew and Alathea

#simple math
2+2
2*2
3^10
4/5

##objects
x<-5
x*2
x^3

##math functions
x^10
log(x)
log10(x)
sin(30)
?sin
x
x>2
x<3
#para saber se um número é igual ao outro usa-se == 
#para rodar sem precisar clicar no r clicar em ctrl e r ou crtl e entra.

x==5
x<-1000
x

#para não precisar escrever <- toda hora clicar em alt e no sinal de - .
#testando o que aprendemos

mass <- 47.5
mass
age <- 122
age
mass <- mass*2.3
mass
age <- age-20
age
mass>age
age < mass

##
##DATA TYPES

#logical

a <- TRUE
b <- FALSE 

#integer
c <- 5L

#duble
d <- 5

#complex number
e <- 1+2i

#character
f <- "cat"

#what type of data type do ta have?
typeof(c)
typeof(d)

is.integer(c)
is.double(d)

#logical
answer <- TRUE
#numeric
height<-5
#character
dog_name<-"dog"
is.logical(answer)
is.numeric(height)
is.character(dog_name)

## Data structures
#vector
vec1<-vector("character")
vec1
vec2 <- vector("character", length = 5)
vec2
vec3 <- c(1,2,3,4,5)
vec3
#os : pega todos os valores dentro do intervalo
vec4 <- c(0:100)
vec4
#agrupando os dados em intervalos de o.5
vec5 <- seq(0,100, by = 0.5)
vec5

vec6 <- c(TRUE, 10L, "cat")
vec6
typeof(vec6)
#assim como o is tem a função as.
as.double(vec6)

##Getting information about an objetic structure
x <- 0:1000
x
length(x)
str(x)
head(x)
tail(x)

ages <- c(23,24,25,32,49)
ages
names(ages)<- c("Juliana", "Rodrigo", "Carlos", "Bella, "Andrew")
ages
typeof(ages)

ages2 <- c(23,24,25,32,49)
typeof(ages2)

##what the difference between numeric and duble type?
#numeric não é um tipo de type. Numeric pode ser duble ou interger.

##matrices
x <- matrix(1:10, nrow =5, ncol =2)
x
str(x)

rownames(x) <-c("a","b", "c", "d", "e")
colnames(x) <- c("a", "b")
# esta função vai pegar 18 valores de uma distribuição normal
rnorm(18)
x<-matrix(rnorm(18), ncol=6, nrow=3)
x
length(x)

#challenge
x <- matrix(1:150, ncol=5, nrow=10)

#Colocando a função byrow agora a matriz será arrumada pela linha e não mais pela coluna como antes
x <- matrix(1:150, ncol=5, nrow=10, byrow=TRUE)# outra forma é a exposta abaixo
x <- matrix(1:150, ncol=5,nrow=TRUE)
#É melhor usar a palavra TRUE e não apenas o T, pois a palavra TRUE nunca pode ser nomeada como false, mas o T pode

## Factors
### é quando vc possui variáveis categóricas
x <- factor(c("yes", "no", "yes", "yes"))
x
typeof(x)
str(x)

# O NÚMERO DOS NÍVEIS É COLOCADO PELA ORDEM ALFABÉTICA, LOGO NO SERÁ 1 E YES SERÁ 2
x <- factor(c("case", "control", "control", "case"))
levels=(c("control", "case"))
x
str(x)

## Lists: contain multiple data types
x <- list (1, "a", TRUE, 5L)
x
xlist <- list(name= "Iris Dat", nums= 1:10, data = head(iris))
xlist

## Data frame:pode ter dados de vários tipos de natureza. Já uma matriz só possui dados de uma natureza. 

df <- data.frame(a=c(1,2,3), b=c("a", "b", "c"), c=c(TRUE, FALSE, FALSE))
df
#Challenge
df <- data.frame(id = c("a", "b", "c", "d", "e", "f"), x=1:6, y=c(214:219))
df
length(df)

#Adding row and columns to data frames

rbind(df, df)
cbind(df, df)
#combine two datasets - cada coluna deve ter o mesmo Type de dados, se vc colocar um número no lugar do nome em df1 ele não vai rodar
df1 <- data.frame(firstname = "Marina", lastname="Moreira",age=30)
df1
df2 <- data.frame(firstname = "Pedro", lastname="Ferreira", age=23)
total <-rbind(df1,df2)
cbind(df1, df2)
str(total)

## Subsetting 
###taking out parts of larger objects - x é uma sequencia como um trem

x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c("a", "b", "c", "d", "e")
typeof(x)
is.double(x)
is.numeric(x)

x[1]
x[3]
x[c(3,5)]
# we can do the same with
x[2:4]
x[c(1,1,1,4)]
# se colocarmos um valor que não existe ele diz que não está disponível
x[10]
x[1:5]
x[5:1]

## skipping elements
#retira o elemento 1 de x
x[-1]
x[-c(2,4)]

#Challenge
x
x[2:4]
x[c(2,3,4)]
x[-c(1,5)]
x[c("b", "c", "d")]

x[c(FALSE, TRUE,TRUE,TRUE, FALSE)]

##SUBSETTING BYNAMES
x["a"]
#Para saber a posição de um obj no data frame usa-se name
is_it_b <- names(x)=="b"
x[is_it_b]
#para achar a posição de mais de um obj no data frame usa-se %in%
names(x)%in%c("b","c","d")
names(x)
x[names(x)%in%c("b","c","d")]# bom para ser usado em dataset muito grande.

### multiple conditions
a <- 1:10
a > 7
a[a >7]
a[a< 7]
a[a <= 7]
TRUE & FALSE
TRUE & TRUE
FALSE & FALSE 
TRUE | FALSE
c(TRUE, FALSE| c(FALSE, TRUE))

1:5*2
1:5*1:5

####cHALLENGE
x <- 1:10
##write a subsetting command to return the values in x that are greater than 4, and less than 7.
a<-x>4
a
b<-x<7
d<- a&b
d
x[d]

#outras formas de fazer o mesmo de cima
x[x>4 & x<7]

## how many times is x greater than 6???
as.numeric(x>6)
sum(x>6)

## matrices

set.seed(1)# é interessante  para gerar dados aleatórios iguais. Ou seja, eu quero fazer uma aleatorização, mas feito essa eu quero que a proxima seja igual, por isso deve-se usar o set.seed
rnorm(6*4)
m <- matrix(rnorm(6*4), ncol=4, nrow =6)
m
## first 3 rows
###second and third columns
m[1:3, c(2,3)]# o primeiro item são as colunas o seg a linha
m[,3]
m[3,]
m[1:2,]
m

##subsetting lists
xlist <- list(a ="UFRJ", b=1:10, c=head(iris))
xlist
##Forma de extrair a palavra UFRJ DO DATA FRAME
xlist[1]
xlist["a"]
xlist$a
xlist[[1]]
xlist[["a"]]
uni1 <- xlist[1]
uni2 <- xlist[[1]]
typeof(uni1)
typeof(uni2)
xlist

f1<-xlist[["b"]]#quando coloca-se duas chaves a gente retira completamente o vagão do trem
# colocando as duas chaves isolamos completamente b do restante do data frame. Se colocasse apenas uma estariamos apenas vendo b, mas ainda junto do trem
f1[2]
#pode ser feito em apenas um passo
xlist[["b"]][2]

##reading in data

gapminder <- read.csv("gapminder.csv", header=TRUE)#outra forma que o Andrew coloca é read.csv("gapminder.csv") e depois chama outro comando heade(gapminder)
gapminder
str(gapminder)

gapminder[, "pop"]
gapminder$pop

gapminder[1:2, ]#pegar as duas primeiras linhas (linha, coluna)

str(gapminder)

brasil <- gapminder$country == "Brazil"#como fazer para selecionar apenas o brasil dentro da coluna paises
gapminder[brasil,]#quero todas as linhas que começam com Brasil e todas as colunas, por isso não defino as colonas apenas as linhas

### plotting
library(ggplot2)
ggplot(data = gapminder, aes(x=lifeExp, y=gdpPercap))+geom_point()
ggplot(data = gapminder, aes(x=lifeExp, y= gdpPercap, color =country))+geom_point()
ggplot(data = gapminder, aes(x= year, y= lifeExp, color =country))+geom_line()+geom_point()
#line plots
ggplot(data = gapminder, aes(x=year, y=lifeExp))+geom_line(aes(colour = country))+geom_point()
ggplot(data = gapminder, aes(x=year, y=lifeExp))+geom_line(aes(colour = country))+geom_point(color ="blue")
ggplot(data = gapminder, aes(x=year, y=lifeExp))+geom_point(aes(colour = "blue"))+geom_line(aes(colour=country))

#Transformações e estatísticas
ggplot(gapminder, aes(x=lifeExp, y=gdpPercap, colour = continent))+geom_point()+
  scale_y_log10()+#Transformando a escala do eixo y em log
  stat_smooth(metho="lm")#vai estar relacionado com a estatistica. 
gm90<-gapminder[gapminder$year>1990,] 
head(gm90)

ggplot(gm90, aes(x= lifeExp, y=gdpPercap))+geom_point()+
  scale_y_log10()+
  stat_smooth(method= "lm")+#stat_smooth é igual a geom_smooth
  facet_wrap(~year)#usa para dividir os dados entre os anos, será que posso usar isso para separar dia e noite?

ggplot(gm90, aes(x= lifeExp, y=gdpPercap))+geom_point()+
  scale_y_log10()+
  stat_smooth(method= "lm")+#stat_smooth é igual a geom_smooth
  facet_grid(continent~year)#(linhas ~colunas)
