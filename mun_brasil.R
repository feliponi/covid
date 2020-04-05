#1 Loading data 
library(readr)
tabela1301 <- read_delim("tabela1301.csv", 
                         ";", escape_double = FALSE, col_types = cols(Area = col_number(), 
                                                                      Densidade = col_number(), Municipio = col_character(), 
                                                                      NivelDensidade = col_character(), 
                                                                      Populacao = col_number(), CasosCovid19 = col_number()), trim_ws = TRUE)


View(tabela1301)

attach(tabela1301)

names(tabela1301)

library(ggplot2)

#log to normalize columns Density and Covid Cases
gg <- ggplot(mun, aes(x=log(CasosCovid19), y=log(Densidade), color=NivelDensidade)) + geom_point() + labs(title="", x="Casos Covid-19", y="Densidade")

print(gg)


gg1 <- gg + theme(plot.title=element_text(size=30, face="bold"), 
                  axis.text.x=element_text(size=15), 
                  axis.text.y=element_text(size=15),
                  axis.title.x=element_text(size=15),
                  axis.title.y=element_text(size=15)) + 
scale_color_discrete(name="Densidade Populacional")  

print(gg1)

gg1 + facet_wrap( ~ NivelDensidade, ncol=3) 
