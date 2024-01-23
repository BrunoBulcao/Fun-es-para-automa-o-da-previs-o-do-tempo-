# Função plot das variavies 
# 
#-------------------------------------------------------------------------------
library(ggplot2)
library(dplyr)
library(openxlsx)
library(scales)
library(gridExtra)

Plot_GEFS <- function(){
  
  Dados <- read.xlsx("Previsão_5_dias.xlsx")  
  Dados$DateTime <- as.POSIXct(paste(Dados$Data, Dados$Hora), format="%d-%m-%Y %H:%M")
  
  custom_x_labels <- function(x) {
    datetimes <- as.POSIXct(x, origin="1970-01-01")
    dates <- as.Date(datetimes)
    hours <- format(datetimes, "%H")
    labels <- vector("character", length(datetimes))
    
    for(i in 1:length(datetimes)) {
      if (!is.na(dates[i])) {
        if(hours[i] == "03") {
          labels[i] <- format(datetimes[i], "%Hh\n%d-%m")
        } else {
          labels[i] <- format(datetimes[i], "%Hh")
        }
      }
    }
    
    return(labels)
  }
  
  custom_x_labels_1 <- function(x) {
    datetimes <- as.POSIXct(x, origin="1970-01-01")
    dates <- as.Date(datetimes)
    hours <- format(datetimes, "%H")
    labels <- vector("character", length(datetimes))
    
    for(i in 1:length(datetimes)) {
      if (!is.na(dates[i])) {
        if(hours[i] == "03") {
          labels[i] <- format(datetimes[i], "              %Hh \n             %d-%m")
        } else {
          labels[i] <- format(datetimes[i], "              %Hh")
        }
      }
    }
    
    return(labels)
  }
  
#-------------------------------------------------------------------------------
  
  Temperatura <- ggplot(Dados, aes(x=DateTime, y=`Temperatura(ºC)`)) +
    geom_line(color = "#FF0000", linewidth = 1) +
    geom_point(size = 3, color = "#510000") + 
    geom_text(aes(label=sprintf(" %.1f", `Temperatura(ºC)`)), vjust= -2, hjust= 0.5, size=6, fontface = "bold") +
    scale_x_datetime(breaks = date_breaks("6 hours"), labels = custom_x_labels) +
    labs(title="Temperatura do ar a 2m da superfície para os próximos 5 dias", x="Data e Hora", y="Temperatura (ºC)") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 15, face = "bold"),
          axis.text.y = element_text(size = 20), 
          axis.title.x = element_text(size = 20, face = "bold", margin = margin(t = 10, b = 1)),
          axis.title.y = element_text(size = 20, face = "bold", margin = margin(t = 10, b = 1, r = 10)),
          plot.title = element_text(size = 20, face = "bold", hjust = 0.5, margin = margin(t = 1, b = 10)),
          panel.background = element_rect(fill = "#FFEAEA")) +
    expand_limits(y = max(Dados$`Temperatura(ºC)`) + 1)

  #----------------------------------------------------------
  
  umidade <- ggplot(Dados, aes(x=DateTime, y=`Umidade(%)`)) +
    geom_line(color = "#E7E406", linewidth = 1) +
    geom_point(size = 3, color = "#7C7A00") + 
    geom_text(aes(label=sprintf("%d", round(`Umidade(%)`)), 
                  vjust=ifelse(`Umidade(%)` < 50, 1.5, -1)), hjust= 0.5, size=6, fontface = "bold") +
    scale_x_datetime(breaks = date_breaks("6 hours"), labels = custom_x_labels) +
    labs(title="Umidade relativa do ar para os próximos 5 dias", x="Data e Hora", y="Umidade relativa do ar (%)") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 15, face = "bold"),
          axis.text.y = element_text(size = 20), 
          axis.title.x = element_text(size = 20, face = "bold", margin = margin(t = 10, b = 1)),
          axis.title.y = element_text(size = 20, face = "bold", margin = margin(t = 10, b = 1, r = 10)),
          plot.title = element_text(size = 20, face = "bold", hjust = 0.5, margin = margin(t = 1, b = 10)),
          panel.background = element_rect(fill = "#FFFFE6")) +
    expand_limits(y = max(Dados$`Umidade(%)`) + 5)
  
  #----------------------------------------------------------

  chuva <- ggplot(Dados, aes(x=DateTime, y=`Precipitação(mm)`)) +
    geom_line(color = "#00D8FF", linewidth = 1) +
    geom_point(size = 3, color = "#006559") + 
    geom_text(aes(label=sprintf(" %.1f", `Precipitação(mm)`)), vjust= -1, hjust= 0.5, size=6, fontface = "bold") +
    scale_x_datetime(breaks = date_breaks("6 hours"), labels = custom_x_labels) +
    labs(title="Precipitação para os próximos 5 dias", x="Data e Hora", y="Precipitação (mm)") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 0, hjust = 0.5, size = 15, face = "bold"),
          axis.text.y = element_text(size = 20), 
          axis.title.x = element_text(size = 20, face = "bold", margin = margin(t = 10, b = 1)),
          axis.title.y = element_text(size = 20, face = "bold", margin = margin(t = 10, b = 1, r = 10)),
          plot.title = element_text(size = 20, face = "bold", hjust = 0.5, margin = margin(t = 1, b = 10)),
          panel.background = element_rect(fill = "#E6FFFC")) +
    expand_limits(y = max(Dados$`Precipitação(mm)`) + 1)  
  
  #-----------------------------------------------------------------------------
 
   Vento <- ggplot(Dados, aes(y = `Velocidade.do.Vento(km/h)`, x = DateTime)) +
    geom_bar(stat = "identity", fill = "#F8D3FF", color = "#8600A1", position = position_nudge(x = 3 * 3600)) +
     
    
    geom_text(
      aes(
        label = sprintf(" %.1f\n %s", `Velocidade.do.Vento(km/h)`,`Sigla.e.sentido.do.Vento`)),
      vjust = 0.7, hjust = 0.5, size = 5, fontface = "bold", position = position_nudge(x = 3 * 3600)) +
    
    expand_limits(y = max(Dados$`Velocidade.do.Vento(km/h)` + 3)) +
    labs(title = "Intensidade do Vento para os próximos 5 dias", x = "Data e Hora", y = "Velocidade do Vento (km/h)") +
    theme_minimal() +
    scale_x_datetime(breaks = date_breaks("6 hours"), labels = custom_x_labels_1) +
    theme(
      axis.text.x = element_text(angle = 0, hjust = 0.5, size = 15, face = "bold"),
      axis.text.y = element_text(size = 20),
      axis.title.x = element_text(size = 20, face = "bold", margin = margin(t = 10, b = 1)),
      axis.title.y = element_text(size = 20, face = "bold", margin = margin(t = 10, b = 1, r = 10)),
      plot.title = element_text(size = 20, face = "bold", hjust = 0.5, margin = margin(t = 1, b = 10)),
      panel.background = element_rect(fill = "#FDF4FF")
    )

  
 # grid_arrange = arrangeGrob(Temperatura, umidade, chuva, Vento, ncol = 2)
  #-----------------------------------------------------------------------------
  
  ggsave("Temperatura.jpeg", plot = Temperatura, width = 12, height = 7, dpi = 600)
  
  ggsave("Umidade.jpeg", plot = umidade, width = 12, height = 7, dpi = 600)
  
  ggsave("Precipi.jpeg", plot = chuva, width = 12, height = 7, dpi = 600)
  
  ggsave("Vento.jpeg", plot = Vento, width = 12, height = 7, dpi = 600)
  
  #ggsave("Todas.jpeg", plot = grid_arrange, width = 40, height = 25, dpi = 600)
  
}


Plot_GEFS()


