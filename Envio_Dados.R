# Envio das informações por email 
#
#-------------------------------------------------------------------------------
library(mailR)

Envio <- function(Endereco_Email){

remetente <- "automacaogefsppgmet@gmail.com"

destinatario <- Endereco_Email

assunto <- "PREVISÃO DO TEMPO PARA OS PRÓXIMOS 5 DIAS"

corpo <- paste("Este é um email que fornece a previsão do tempo atualizada para os próximos 5 dias. Em anexo, você encontrará:", "\n",
               "Previsão_do_Tempo_5_Dias.xlsx - Um arquivo Excel detalhando com temperatura, umidade relativa do ar e precipitação.", "\n",
               "Gráficos_Previsão_do_Tempo.png - Imagens ilustrativas das previsões meteorológicas.")

servidor_smtp <- "smtp.gmail.com"

porta <- 465

usuario <- remetente

senha <- "cywiupfqvzpbrcov"

send.mail(
  from = remetente,
  to = destinatario,
  subject = assunto,
  body = corpo,
  smtp = list(
    host.name = servidor_smtp,
    port = porta,
    user.name = usuario,
    passwd = senha,
    ssl = TRUE
  ),
  authenticate = TRUE,
  send = TRUE,
  attach.files = c("Previsão_5_dias.xlsx", "Temperatura.jpeg", "Umidade.jpeg", "Precipi.jpeg", "Vento.jpeg")
)

}

#Envio("brunobulcao1994@gmail.com")




