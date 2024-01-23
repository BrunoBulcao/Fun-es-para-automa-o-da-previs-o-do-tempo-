Automação da Previsão do Tempo em R
Este repositório contém um conjunto de funções em R desenvolvidas para automatizar a aquisição, 
processamento e visualização de dados meteorológicos. O objetivo é facilitar o acesso a previsões
meteorológicas detalhadas, gerar gráficos informativos e enviar essas informações automaticamente por e-mail.

Recursos
Download de Dados Meteorológicos: Baixa dados do modelo GEFS da NOAA.
Geração de Previsões Meteorológicas: Processa os dados baixados para criar previsões detalhadas.
Visualização de Dados: Cria gráficos visuais para temperaturas, umidade, precipitação, etc.
Envio Automatizado: Envia as previsões e gráficos gerados por e-mail.
Começando
Pré-requisitos
Certifique-se de ter instalado o R e Rstudio e as seguintes bibliotecas:

curl
sp
rgdal
raster
dplyr
openxlsx
ggplot2
scales
gridExtra
mailR

instalação
Clone o repositório para a sua máquina local usando:
git clone https://github.com/BrunoBulcao/Fun-es-para-automa-o-da-previs-o-do-tempo-.git

Uso
Baixar Dados Meteorológicos: Baixar_Dados_GEFS()
Gerar Previsões e Gráficos: Extração_GEFS(latitude, longitude, email)
Enviar Previsões por E-mail: Envio(email)

Contribuições são bem-vindas e desempenham um papel vital no desenvolvimento contínuo deste projeto. 
Se você deseja contribuir, sinta-se à vontade para abrir um pull request ou uma issue.

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE.md para detalhes.

Bruno Coelho Bulcão - Trabalho Inicial - BrunoBulcao
E-mail: brunobulcao1994@gmail.com




















