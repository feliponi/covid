#1 carregando os dados (* aten??o para o endere?o do arquivo)
library(readr)
tabela1301 <- read_delim("~/Documents/Pós-Graduação/4.Técnicas Estatísticas de Predição/tabela1301.csv", 
                         ";", escape_double = FALSE, col_types = cols(Area = col_number(), 
                                                                      Densidade = col_number(), Municipio = col_character(), 
                                                                      NivelDensidade = col_character(), 
                                                                      Populacao = col_number(), CasosCovid19 = col_number()), trim_ws = TRUE)


View(tabela1301)

attach(tabela1301)

names(tabela1301)

mun<-tabela1301

library(ggplot2)

#log para normalizar
gg <- ggplot(mun, aes(x=log(mun$CasosCovid19), y=log(mun$Densidade), color=mun$NivelDensidade)) + geom_point() + labs(title="", x="Casos Covid-19", y="Densidade")  # add axis lables and plot title.

print(gg)


gg1 <- gg + theme(plot.title=element_text(size=30, face="bold"), 
                  axis.text.x=element_text(size=15), 
                  axis.text.y=element_text(size=15),
                  axis.title.x=element_text(size=15),
                  axis.title.y=element_text(size=15)) + 
scale_color_discrete(name="Densidade Populacional")  # add title and axis text, change legend title.

print(gg1)

gg1 + facet_wrap( ~ NivelDensidade, ncol=3) 
