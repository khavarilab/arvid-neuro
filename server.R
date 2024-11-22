# Contains server logic 

serv <- function(input, output) {
  
  output$studydata <- renderDataTable({
    data = df_studydata
    if (input$disease != 'All') {
      data = data[data$`Associated Disease` %in% input$disease, ]
    }
    if (input$atac != 'All') {
      data = data[data$`ATAC Activity` %in% input$atac, ]
    }
    if (input$hichip!= 'All') {
      data = data[data$`HiChIP Activity` %in% input$hichip, ]
    }
    datatable(data, options = list(scrollX = TRUE))
  })
  
  output$studymeta <- renderTable({
    df_studymeta
  }, striped = T)
  
  output$columnmeta <- renderTable({
    df_columnmeta
  }, striped = T)
}



