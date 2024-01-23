# Previsão para 5 dia 
# Alfa Metereorologia 
#-------------------------------------------------------------------------------
library(sp)
library(rgdal)
library(raster)
library(dplyr)
library(openxlsx)



Previsao <- function(latitude,longitude){

# 1 Dia Pra frente
Arquivo_18 <- brick("geavg.t12z.pgrb2a.0p50.f018")
Arquivo_24 <- brick("geavg.t12z.pgrb2a.0p50.f024")
Arquivo_30 <- brick("geavg.t12z.pgrb2a.0p50.f030")
Arquivo_36 <- brick("geavg.t12z.pgrb2a.0p50.f036")

#2 Dia Pra frente
Arquivo_42 <- brick("geavg.t12z.pgrb2a.0p50.f042")
Arquivo_48 <- brick("geavg.t12z.pgrb2a.0p50.f048")
Arquivo_54 <- brick("geavg.t12z.pgrb2a.0p50.f054")
Arquivo_60 <- brick("geavg.t12z.pgrb2a.0p50.f060")

# 3 Dia Pra frente
Arquivo_66 <- brick("geavg.t12z.pgrb2a.0p50.f066")
Arquivo_72 <- brick("geavg.t12z.pgrb2a.0p50.f072")
Arquivo_78 <- brick("geavg.t12z.pgrb2a.0p50.f078")
Arquivo_84 <- brick("geavg.t12z.pgrb2a.0p50.f084")

# 4 Dia Pra frente
Arquivo_90 <- brick("geavg.t12z.pgrb2a.0p50.f090")
Arquivo_96 <- brick("geavg.t12z.pgrb2a.0p50.f096")
Arquivo_102 <- brick("geavg.t12z.pgrb2a.0p50.f102")
Arquivo_108 <- brick("geavg.t12z.pgrb2a.0p50.f108")

# 5 Dia Pra frente
Arquivo_114 <- brick("geavg.t12z.pgrb2a.0p50.f114")
Arquivo_120 <- brick("geavg.t12z.pgrb2a.0p50.f120")
Arquivo_126 <- brick("geavg.t12z.pgrb2a.0p50.f126")
Arquivo_132 <- brick("geavg.t12z.pgrb2a.0p50.f132")
#
# #-------------------------------------------------------------------------------
# # Selecionar ponto de previsão
#
lat <-   latitude
lon <-   longitude

# Seleção para 1 dia pra frente
Ponto_18 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_18)))
Ponto_24 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_24)))
Ponto_30 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_30)))
Ponto_36 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_36)))

# Seleção para 2 dia pra frente
Ponto_42 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_42)))
Ponto_48 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_48)))
Ponto_54 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_54)))
Ponto_60 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_60)))

# Seleção para 3 dia pra frente
Ponto_66 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_66)))
Ponto_72 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_72)))
Ponto_78 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_78)))
Ponto_84 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_84)))

# Seleção para 4 dia pra frente
Ponto_90 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_90)))
Ponto_96 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_96)))
Ponto_102 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_102)))
Ponto_108 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_108)))

# Seleção para 5 dia pra frente
Ponto_114 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_114)))
Ponto_120 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_120)))
Ponto_126 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_126)))
Ponto_132 <- SpatialPoints(data.frame(x = lon, y = lat), proj4string = CRS(projection(Arquivo_132)))

# #===============================================================================
# #-------------------------------------------------------------------------------
# Seleção da Variável Temperatura para 1 dia pra frente
valor_no_ponto_18 <- round(extract(Arquivo_18$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_18),2)
valor_no_ponto_24 <- round(extract(Arquivo_24$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_24),2)
valor_no_ponto_30 <- round(extract(Arquivo_30$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_30),2)
valor_no_ponto_36 <- round(extract(Arquivo_36$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_36),2)

# Seleção da Variável Temperatura para 2 dia pra frente
valor_no_ponto_42 <- round(extract(Arquivo_42$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_42),2)
valor_no_ponto_48 <- round(extract(Arquivo_48$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_48),2)
valor_no_ponto_54 <- round(extract(Arquivo_54$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_54),2)
valor_no_ponto_60 <- round(extract(Arquivo_60$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_60),2)

# Seleção da Variável Temperatura para 3 dia pra frente
valor_no_ponto_66 <- round(extract(Arquivo_66$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_66),2)
valor_no_ponto_72 <- round(extract(Arquivo_72$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_72),2)
valor_no_ponto_78 <- round(extract(Arquivo_78$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_78),2)
valor_no_ponto_84 <- round(extract(Arquivo_84$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_84),2)

# Seleção da Variável Temperatura para 4 dia pra frente
valor_no_ponto_90 <- round(extract(Arquivo_90$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_90),2)
valor_no_ponto_96 <- round(extract(Arquivo_96$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_96),2)
valor_no_ponto_102 <- round(extract(Arquivo_102$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_102),2)
valor_no_ponto_108 <- round(extract(Arquivo_108$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_108),2)

# Seleção da Variável Temperatura para 5 dia pra frente
valor_no_ponto_114 <- round(extract(Arquivo_114$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_114),2)
valor_no_ponto_120 <- round(extract(Arquivo_120$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_120),2)
valor_no_ponto_126 <- round(extract(Arquivo_126$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_126),2)
valor_no_ponto_132 <- round(extract(Arquivo_132$X2.m..HTGL.Specified.height.level.above.ground..Temperature..C., Ponto_132),2)

#
# #===============================================================================
# #-------------------------------------------------------------------------------
# Seleção da Variável Umidade no dia atual
# Seleção da Variável Umidade para 1 dia pra frente
valor_umidade_18 <- round(extract(Arquivo_18$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_18),2)
valor_umidade_24 <- round(extract(Arquivo_24$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_24),2)
valor_umidade_30 <- round(extract(Arquivo_30$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_30),2)
valor_umidade_36 <- round(extract(Arquivo_36$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_36),2)

# Seleção da Variável Umidade para 2 dia pra frente
valor_umidade_42 <- round(extract(Arquivo_42$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_42),2)
valor_umidade_48 <- round(extract(Arquivo_48$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_48),2)
valor_umidade_54 <- round(extract(Arquivo_54$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_54),2)
valor_umidade_60 <- round(extract(Arquivo_60$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_60),2)

# Seleção da Variável Umidade para 3 dia pra frente
valor_umidade_66 <- round(extract(Arquivo_66$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_66),2)
valor_umidade_72 <- round(extract(Arquivo_72$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_72),2)
valor_umidade_78 <- round(extract(Arquivo_78$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_78),2)
valor_umidade_84 <- round(extract(Arquivo_84$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_84),2)

# Seleção da Variável Umidade para 4 dia pra frente
valor_umidade_90 <- round(extract(Arquivo_90$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_90),2)
valor_umidade_96 <- round(extract(Arquivo_96$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_96),2)
valor_umidade_102 <- round(extract(Arquivo_102$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_102),2)
valor_umidade_108 <- round(extract(Arquivo_108$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_108),2)

# Seleção da Variável Umidade para 5 dia pra frente
valor_umidade_114 <- round(extract(Arquivo_114$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_114),2)
valor_umidade_120 <- round(extract(Arquivo_120$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_120),2)
valor_umidade_126 <- round(extract(Arquivo_126$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_126),2)
valor_umidade_132 <- round(extract(Arquivo_132$X2.m..HTGL.Specified.height.level.above.ground..Relative.humidity...., Ponto_132),2)

# #===============================================================================
# #-------------------------------------------------------------------------------
# Seleção da Variável Precipitação para 5 dia pra frente

# Seleção da Variável Precipitação para 1 dia pra frente
valor_prec_18 <- round(extract(Arquivo_18$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_18),1)
valor_prec_24 <- round(extract(Arquivo_24$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_24),1)
valor_prec_30 <- round(extract(Arquivo_30$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_30),1)
valor_prec_36 <- round(extract(Arquivo_36$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_36),1)

# Seleção da Variável Precipitação para 2 dia pra frente
valor_prec_42 <- round(extract(Arquivo_42$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_42),1)
valor_prec_48 <- round(extract(Arquivo_48$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_48),1)
valor_prec_54 <- round(extract(Arquivo_54$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_54),1)
valor_prec_60 <- round(extract(Arquivo_60$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_60),1)

# Seleção da Variável Precipitação para 3 dia pra frente
valor_prec_66 <- round(extract(Arquivo_66$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_66),1)
valor_prec_72 <- round(extract(Arquivo_72$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_72),1)
valor_prec_78 <- round(extract(Arquivo_78$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_78),1)
valor_prec_84 <- round(extract(Arquivo_84$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_84),1)

# Seleção da Variável Precipitação para 4 dia pra frente
valor_prec_90 <- round(extract(Arquivo_90$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_90),1)
valor_prec_96 <- round(extract(Arquivo_96$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_96),1)
valor_prec_102 <- round(extract(Arquivo_102$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_102),1)
valor_prec_108 <- round(extract(Arquivo_108$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_108),1)

# Seleção da Variável Precipitação para 5 dia pra frente
valor_prec_114 <- round(extract(Arquivo_114$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_114),1)
valor_prec_120 <- round(extract(Arquivo_120$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_120),1)
valor_prec_126 <- round(extract(Arquivo_126$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_126),1)
valor_prec_132 <- round(extract(Arquivo_132$SFC.Ground.or.water.surface..06.hr.Total.precipitation..kg..m.2..  , Ponto_132),1)


# #===============================================================================
# #-------------------------------------------------------------------------------
# Seleção da Variável Velocidade do vento para 5 dia pra frente

# Primeiro Dia
u_18 <- extract(Arquivo_18$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_18)
v_18 <- extract(Arquivo_18$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_18)
Velocidade_Vento_18 <- round(sqrt(u_18^2 + v_18^2),1) * 3.6 

u_24 <- extract(Arquivo_24$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_24)
v_24 <- extract(Arquivo_24$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_24)
Velocidade_Vento_24 <- round(sqrt(u_24^2 + v_24^2),1) * 3.6 

u_30 <- extract(Arquivo_30$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_30)
v_30 <- extract(Arquivo_30$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_30)
Velocidade_Vento_30 <- round(sqrt(u_30^2 + v_30^2),1) * 3.6 

u_36 <- extract(Arquivo_36$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_36)
v_36 <- extract(Arquivo_36$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_36)
Velocidade_Vento_36 <- round(sqrt(u_36^2 + v_36^2),1) * 3.6 

# Segundo Dia
u_42 <- extract(Arquivo_42$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_42)
v_42 <- extract(Arquivo_42$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_42)
Velocidade_Vento_42 <- round(sqrt(u_42^2 + v_42^2),1) * 3.6 

u_48 <- extract(Arquivo_48$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_48)
v_48 <- extract(Arquivo_48$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_48)
Velocidade_Vento_48 <- round(sqrt(u_48^2 + v_48^2),1) * 3.6 

u_54 <- extract(Arquivo_54$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_54)
v_54 <- extract(Arquivo_54$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_54)
Velocidade_Vento_54 <- round(sqrt(u_54^2 + v_54^2),1) * 3.6 

u_60 <- extract(Arquivo_60$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_60)
v_60 <- extract(Arquivo_60$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_60)
Velocidade_Vento_60 <- round(sqrt(u_60^2 + v_60^2),1) * 3.6 

# Terceiro Dia
u_66 <- extract(Arquivo_66$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_66)
v_66 <- extract(Arquivo_66$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_66)
Velocidade_Vento_66 <- round(sqrt(u_66^2 + v_66^2),1) * 3.6 

u_72 <- extract(Arquivo_72$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_72)
v_72 <- extract(Arquivo_72$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_72)
Velocidade_Vento_72 <- round(sqrt(u_72^2 + v_72^2),1) * 3.6 

u_78 <- extract(Arquivo_78$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_78)
v_78 <- extract(Arquivo_78$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_78)
Velocidade_Vento_78 <- round(sqrt(u_78^2 + v_78^2),1) * 3.6 

u_84 <- extract(Arquivo_84$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_84)
v_84 <- extract(Arquivo_84$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_84)
Velocidade_Vento_84 <- round(sqrt(u_84^2 + v_84^2),1) * 3.6 

# Quarto Dia
u_90 <- extract(Arquivo_90$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_90)
v_90 <- extract(Arquivo_90$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_90)
Velocidade_Vento_90 <- round(sqrt(u_90^2 + v_90^2),1) * 3.6 

u_96 <- extract(Arquivo_96$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_96)
v_96 <- extract(Arquivo_96$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_96)
Velocidade_Vento_96 <- round(sqrt(u_96^2 + v_96^2),1) * 3.6 

u_102 <- extract(Arquivo_102$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_102)
v_102 <- extract(Arquivo_102$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_102)
Velocidade_Vento_102 <- round(sqrt(u_102^2 + v_102^2),1) * 3.6 

u_108 <- extract(Arquivo_108$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_108)
v_108 <- extract(Arquivo_108$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_108)
Velocidade_Vento_108 <- round(sqrt(u_108^2 + v_108^2),1) * 3.6 

# Quinto Dia
u_114 <- extract(Arquivo_114$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_114)
v_114 <- extract(Arquivo_114$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_114)
Velocidade_Vento_114 <- round(sqrt(u_114^2 + v_114^2),1) * 3.6 

u_120 <- extract(Arquivo_120$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_120)
v_120 <- extract(Arquivo_120$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_120)
Velocidade_Vento_120 <- round(sqrt(u_120^2 + v_120^2),1) * 3.6 

u_126 <- extract(Arquivo_126$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_126)
v_126 <- extract(Arquivo_126$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_126)
Velocidade_Vento_126 <- round(sqrt(u_126^2 + v_126^2),1) * 3.6 

u_132 <- extract(Arquivo_132$X10.m..HTGL.Specified.height.level.above.ground..u.component.of.wind..m.s., Ponto_132)
v_132 <- extract(Arquivo_132$X10.m..HTGL.Specified.height.level.above.ground..v.component.of.wind..m.s.,Ponto_132)
Velocidade_Vento_132 <- round(sqrt(u_132^2 + v_132^2),1) * 3.6 

# #===============================================================================
# #-------------------------------------------------------------------------------
# Seleção da Variável Direção do vento para 5 dia pra frente
# Supondo que você já tenha definido u_18, v_18, u_24, v_24

#-------------------------------------------------------------------------------
Dir_Vento <- function(Valor_Dir) {
  Valor <- Valor_Dir
  
  Rosa_Vento <- if (Valor >= 337.5 | Valor <= 22.5) {
    Resultado = "Norte"
    
  } else if (Valor >= 22.6 & Valor <= 67.5) {
    Resultado = "Nordeste"
    
  } else if (Valor >= 67.6 & Valor <= 112.5){
    Resultado = "Leste"
    
  } else if (Valor >= 112.6 & Valor <= 157.5){
    Resultado = "Sudeste"
    
  } else if (Valor >= 157.6 & Valor <= 202.5){
    Resultado = "Sul"
    
  } else if (Valor >= 202.6 & Valor <= 247.5){
    Resultado = "Sudoeste"
    
  } else if (Valor >= 247.6 & Valor <= 292.5){
    Resultado = "Oeste"
    
  } else if (Valor >= 292.6 & Valor <= 337.5){
    Resultado = "Noroeste"
    }
  return(Resultado)
}

#-------------------------------------------------------------------------------

Dir_Vento_Dir <- function(Valor_Dir) {
  Valor <- Valor_Dir
  
  Rosa_Vento <- if ((Valor >= 337.5 | Valor <= 22.5)) {
    Resultado = paste("N", "\n", "\U21D3")
    
  } else if (Valor >= 22.6 & Valor <= 67.5) {
    Resultado = paste("NE", "\n", "\U21D9")
    
  } else if (Valor >= 67.6 & Valor <= 112.5) {
    Resultado = paste("E", "\n", "\U21D0")
    
  } else if (Valor >= 112.6 & Valor <= 157.5) {
    Resultado = paste("SE", "\n", "\U21D6")
    
  } else if (Valor >= 157.6 & Valor <= 202.5) {
    Resultado = paste("S", "\n", "\U21D1")
    
  } else if (Valor >= 202.6 & Valor <= 247.5) {
    Resultado = paste("SO", "\n", "\U21D7")
    
  } else if (Valor >= 247.6 & Valor <= 292.5) {
    Resultado = paste("O", "\n", "\U21D2")
    
  } else if (Valor >= 292.6 & Valor <= 337.5) {
    Resultado = paste("NO", "\n", "\U21D8")
  }
  
  return(Resultado)
}
#-------------------------------------------------------------------------------
# Primeiro Dia
Direcao_18 <- (180 / pi) * atan2(-v_18, -u_18)
Direcao_18 <- round((Direcao_18 + 360) %% 360,1)
Dir_Vento_18 <- Dir_Vento(Direcao_18)
Dir_Vento_18_Dir <- Dir_Vento_Dir(Direcao_18)

Direcao_24 <- (180 / pi) * atan2(-v_24, -u_24)
Direcao_24 <- round((Direcao_24 + 360) %% 360,1)
Dir_Vento_24 <- Dir_Vento(Direcao_24)
Dir_Vento_24_Dir <- Dir_Vento_Dir(Direcao_24)

Direcao_30 <- (180 / pi) * atan2(-v_30, -u_30)
Direcao_30 <- round((Direcao_30 + 360) %% 360,1)
Dir_Vento_30 <- Dir_Vento(Direcao_30)
Dir_Vento_30_Dir <- Dir_Vento_Dir(Direcao_30)

Direcao_36 <- (180 / pi) * atan2(-v_36, -u_36)
Direcao_36 <- round((Direcao_36 + 360) %% 360,1)
Dir_Vento_36 <- Dir_Vento(Direcao_36)
Dir_Vento_36_Dir <- Dir_Vento_Dir(Direcao_36)

# Segundo Dia
Direcao_42 <- (180 / pi) * atan2(-v_42, -u_42)
Direcao_42 <- round((Direcao_42 + 360) %% 360)
Dir_Vento_42 <- Dir_Vento(Direcao_42)
Dir_Vento_42_Dir <- Dir_Vento_Dir(Direcao_42)

Direcao_48 <- (180 / pi) * atan2(-v_48, -u_48)
Direcao_48 <- round((Direcao_48 + 360) %% 360,1)
Dir_Vento_48 <- Dir_Vento(Direcao_48)
Dir_Vento_48_Dir <- Dir_Vento_Dir(Direcao_48)

Direcao_54 <- (180 / pi) * atan2(-v_54, -u_54)
Direcao_54 <- round((Direcao_54 + 360) %% 360,1)
Dir_Vento_54 <- Dir_Vento(Direcao_54)
Dir_Vento_54_Dir <- Dir_Vento_Dir(Direcao_54)

Direcao_60 <- (180 / pi) * atan2(-v_60, -u_60)
Direcao_60 <- round((Direcao_60 + 360) %% 360,1)
Dir_Vento_60 <- Dir_Vento(Direcao_60)
Dir_Vento_60_Dir <- Dir_Vento_Dir(Direcao_60)

# Terceiro Dia
Direcao_66 <- (180 / pi) * atan2(-v_66, -u_66)
Direcao_66 <- round((Direcao_66 + 360) %% 360,1)
Dir_Vento_66 <- Dir_Vento(Direcao_66)
Dir_Vento_66_Dir <- Dir_Vento_Dir(Direcao_66)

Direcao_72 <- (180 / pi) * atan2(-v_72, -u_72)
Direcao_72 <- round((Direcao_72 + 360) %% 360,1)
Dir_Vento_72 <- Dir_Vento(Direcao_72)
Dir_Vento_72_Dir <- Dir_Vento_Dir(Direcao_72)

Direcao_78 <- (180 / pi) * atan2(-v_78, -u_78)
Direcao_78 <- round((Direcao_78 + 360) %% 360,1)
Dir_Vento_78 <- Dir_Vento(Direcao_78)
Dir_Vento_78_Dir <- Dir_Vento_Dir(Direcao_78)

Direcao_84 <- (180 / pi) * atan2(-v_84, -u_84)
Direcao_84 <- round((Direcao_84 + 360) %% 360,1)
Dir_Vento_84 <- Dir_Vento(Direcao_84)
Dir_Vento_84_Dir <- Dir_Vento_Dir(Direcao_84)

# Quarto Dia
Direcao_90 <- (180 / pi) * atan2(-v_90, -u_90)
Direcao_90 <- round((Direcao_90 + 360) %% 360,1)
Dir_Vento_90 <- Dir_Vento(Direcao_90)
Dir_Vento_90_Dir <- Dir_Vento_Dir(Direcao_90)

Direcao_96 <- (180 / pi) * atan2(-v_96, -u_96)
Direcao_96 <- round((Direcao_96 + 360) %% 360,1)
Dir_Vento_96 <- Dir_Vento(Direcao_96)
Dir_Vento_96_Dir <- Dir_Vento_Dir(Direcao_96)

Direcao_102 <- (180 / pi) * atan2(-v_102, -u_102)
Direcao_102 <- round((Direcao_102 + 360) %% 360,1)
Dir_Vento_102 <- Dir_Vento(Direcao_102)
Dir_Vento_102_Dir <- Dir_Vento_Dir(Direcao_102)

Direcao_108 <- (180 / pi) * atan2(-v_108, -u_108)
Direcao_108 <- round((Direcao_108 + 360) %% 360,1)
Dir_Vento_108 <- Dir_Vento(Direcao_108)
Dir_Vento_108_Dir <- Dir_Vento_Dir(Direcao_108)

# Quinto Dia
Direcao_114 <- (180 / pi) * atan2(-v_114, -u_114)
Direcao_114 <- round((Direcao_114 + 360) %% 360,1)
Dir_Vento_114 <- Dir_Vento(Direcao_114)
Dir_Vento_114_Dir <- Dir_Vento_Dir(Direcao_114)

Direcao_120 <- (180 / pi) * atan2(-v_120, -u_120)
Direcao_120 <- round((Direcao_120 + 360) %% 360,1)
Dir_Vento_120 <- Dir_Vento(Direcao_120)
Dir_Vento_120_Dir <- Dir_Vento_Dir(Direcao_120)

Direcao_126 <- (180 / pi) * atan2(-v_126, -u_126)
Direcao_126 <- round((Direcao_126 + 360) %% 360,1)
Dir_Vento_126 <- Dir_Vento(Direcao_126)
Dir_Vento_126_Dir <- Dir_Vento_Dir(Direcao_126)

Direcao_132 <- (180 / pi) * atan2(-v_132, -u_132)
Direcao_132 <- round((Direcao_132 + 360) %% 360,1)
Dir_Vento_132 <- Dir_Vento(Direcao_132)
Dir_Vento_132_Dir <- Dir_Vento_Dir(Direcao_132)


# #===============================================================================
# #-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------

num_dias <- 5

data_inicio <- as.Date(file.info("geavg.t12z.pgrb2a.0p50.f018")$mtime) + 1

datas <- format(seq(data_inicio, by = "day", length.out = num_dias), format = "%d-%m-%Y")

Data <- rep(datas, each=4)  

Hora = rep(c("03:00","09:00","15:00","21:00"))

#-------------------------------------------------------------------------------

Tabela <- data.frame(

  Data = Data,

  Hora = Hora,

  Temperatura = c(
                  valor_no_ponto_18, valor_no_ponto_24, valor_no_ponto_30, valor_no_ponto_36,
                  valor_no_ponto_42, valor_no_ponto_48, valor_no_ponto_54, valor_no_ponto_60,
                  valor_no_ponto_66, valor_no_ponto_72, valor_no_ponto_78, valor_no_ponto_84,
                  valor_no_ponto_90, valor_no_ponto_96, valor_no_ponto_102, valor_no_ponto_108,
                  valor_no_ponto_114, valor_no_ponto_120, valor_no_ponto_126, valor_no_ponto_132),


  Umidade = c(
              valor_umidade_18, valor_umidade_24, valor_umidade_30, valor_umidade_36,
              valor_umidade_42, valor_umidade_48, valor_umidade_54, valor_umidade_60,
              valor_umidade_66, valor_umidade_72, valor_umidade_78, valor_umidade_84,
              valor_umidade_90, valor_umidade_96, valor_umidade_102, valor_umidade_108,
              valor_umidade_114, valor_umidade_120, valor_umidade_126, valor_umidade_132),
  
  Precipitacao = c(
              valor_prec_18, valor_prec_24, valor_prec_30, valor_prec_36,
              valor_prec_42, valor_prec_48, valor_prec_54, valor_prec_60,
              valor_prec_66, valor_prec_72, valor_prec_78, valor_prec_84,
              valor_prec_90, valor_prec_96, valor_prec_102, valor_prec_108,
              valor_prec_114, valor_prec_120, valor_prec_126, valor_prec_132),
  
  Velocidade_vento = c(
              Velocidade_Vento_18, Velocidade_Vento_24, Velocidade_Vento_30, Velocidade_Vento_36,
              Velocidade_Vento_42, Velocidade_Vento_48, Velocidade_Vento_54, Velocidade_Vento_60,
              Velocidade_Vento_66, Velocidade_Vento_72, Velocidade_Vento_78, Velocidade_Vento_84,
              Velocidade_Vento_90, Velocidade_Vento_96, Velocidade_Vento_102, Velocidade_Vento_108,
              Velocidade_Vento_114, Velocidade_Vento_120, Velocidade_Vento_126, Velocidade_Vento_132),
  
  Dir_Vento = c(
              Dir_Vento_18, Dir_Vento_24, Dir_Vento_30, Dir_Vento_36,
              Dir_Vento_42, Dir_Vento_48, Dir_Vento_54, Dir_Vento_60,
              Dir_Vento_66, Dir_Vento_72, Dir_Vento_78, Dir_Vento_84,
              Dir_Vento_90, Dir_Vento_96, Dir_Vento_102, Dir_Vento_108,
              Dir_Vento_114, Dir_Vento_120, Dir_Vento_126, Dir_Vento_132), 
  
  
  Dir_Vento_Dir = c(
    Dir_Vento_18_Dir, Dir_Vento_24_Dir, Dir_Vento_30_Dir, Dir_Vento_36_Dir,
    Dir_Vento_42_Dir, Dir_Vento_48_Dir, Dir_Vento_54_Dir, Dir_Vento_60_Dir,
    Dir_Vento_66_Dir, Dir_Vento_72_Dir, Dir_Vento_78_Dir, Dir_Vento_84_Dir,
    Dir_Vento_90_Dir, Dir_Vento_96_Dir, Dir_Vento_102_Dir, Dir_Vento_108_Dir,
    Dir_Vento_114_Dir, Dir_Vento_120_Dir, Dir_Vento_126_Dir, Dir_Vento_132_Dir)


)

names(Tabela) <- c("Data", "Hora", "Temperatura(ºC)", "Umidade(%)", "Precipitação(mm)", "Velocidade do Vento(km/h)", "Direção do Vento", "Sigla e sentido do Vento")

#-------------------------------------------------------------------------------

wb <- createWorkbook()

addWorksheet(wb, "Dados")

writeData(wb, "Dados", Tabela)

estiloCentralizado <- createStyle(halign = "center")

addStyle(wb, sheet = "Dados", style = estiloCentralizado, rows = 1:100, cols = 1:8, gridExpand = TRUE)

setColWidths(wb, "Dados", cols = 1:NCOL(Tabela), widths = "auto")

saveWorkbook(wb, "Previsão_5_dias.xlsx", overwrite = TRUE)

}


#Previsao(-2.643, -56.700)























