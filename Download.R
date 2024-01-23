
library(curl)

Download_GEFS <- function(Data, Hora) {
  
  url_base <- paste0("https://ftp.ncep.noaa.gov/data/nccf/com/gens/prod/gefs.", Data, "/", Hora, "/atmos/pgrb2ap5/")
  
  download <- sprintf("geavg.t%sz.pgrb2a.0p50.f%03d", Hora, seq(0, 132, by=6))
  
  download_geral(url_base, download)
}

download_geral <- function(url, Pasta_) {
    for (Pasta in Pasta_) {
      url_ <- paste0(url, Pasta)
      Armazenar <- paste0(Pasta)

      tryCatch({
        curl_download(url_, destfile = Armazenar)
        cat("Arquivo", Pasta, "baixado.\n")
      }, error = function(e) {
        cat("Erro ao baixar", Pasta, "-", e$message, "\n")
      })
    }
  }

#Download_GEFS("20240115", "12")



