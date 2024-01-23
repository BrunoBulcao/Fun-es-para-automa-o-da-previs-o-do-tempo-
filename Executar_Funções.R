# Programa de Pós Graduação em Meteorologia - PPGMET 
# Universidade Federal de Pelotas - UFPEL 
# Orientador: Douglas da Silva Lindermann
# Co-Orientadora: Luciana Barros Pinto
# Mestrando: Bruno Coelho Bulcão 
# Automação Previsão do Tempo de Até 5 dias 
# ------------------------------------------------------------------------------
source("Automação_GEFS.R")

#===============================================================================

Extração_GEFS(-23.548, -46.635,"cledenilsonms@gmail.com")

Previsao_Automatica(
  -31.767, -52.500, "douglasdasilva.lindemann@gmail.com",
  -31.771, -52.341, "morganapel@gmail.com",
  -2.638, -56.736, "brunobulcao1994@gmail.com",
  # Hora e Minutos
  15, 19)

