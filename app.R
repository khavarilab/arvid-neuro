# This is the development version of a Shiny app for the ARVID data resource

source('global.R', local = T)
source('ui.R', local = T)
source('server.R', local = T)

shinyApp(
  ui = dash,
  server = serv
)

