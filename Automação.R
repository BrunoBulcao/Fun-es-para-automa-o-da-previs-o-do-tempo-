# Exexultando as funções de automação 

source("Download_GEFS.R")
source("Previsão_5_Dias.R")
source("Grafico_GEFS.R")
source("Envio_Dados.R")

#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
Baixar_Dados_GEFS <- function(){
  
  Data_Atual <- gsub("-", "", as.character(Sys.Date()))
  
  Download_GEFS(Data_Atual, "12")
  
}

#-------------------------------------------------------------------------------

Extração_GEFS <- function(Latitude, Longitude, Email){
  
  Previsao(Latitude, Longitude)
  
  Plot_GEFS()
  
  Envio(Email)
  
}

#-------------------------------------------------------------------------------
Envio_Previsao <- function(Latitude1, Longitude1, Email1, Latitude2, Longitude2, Email2, Latitude3, Longitude3, Email3){
  
  Baixar_Dados_GEFS()
  
  Extração_GEFS(Latitude1, Longitude1, Email1)
  
  Extração_GEFS(Latitude2, Longitude2, Email2)
  
  Extração_GEFS(Latitude3, Longitude3, Email3)
  
}

#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
foi_executada_hoje <- FALSE

Previsao_Automatica <- function(Latitude1, Longitude1, Email1, Latitude2, Longitude2, Email2, Latitude3, Longitude3, Email3, Hora, Minuto) {
  
  while (TRUE) {
    hora_atual <- as.POSIXlt(Sys.time())$hour
    minuto_atual <- as.POSIXlt(Sys.time())$min
    
    hora_execucao <- Hora
    minuto_execucao <- Minuto
    
    if (!foi_executada_hoje && hora_atual == hora_execucao && minuto_atual == minuto_execucao) {
      Envio_Previsao(Latitude1, Longitude1, Email1, Latitude2, Longitude2, Email2, Latitude3, Longitude3, Email3) 
      foi_executada_hoje <- TRUE
      timestamp <- format(Sys.time(), "%d-%m-%Y %H:%M:%S")
      cat("A função foi executada em", timestamp, ". Aguardando a próxima execução que será amanhã no mesmo horário.\n")
      
    }
    
    if (hora_atual > hora_execucao || (hora_atual == hora_execucao && minuto_atual > minuto_execucao)) {
      foi_executada_hoje <- FALSE
    }
    
    Sys.sleep(60)
  }
}

