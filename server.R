library(shiny)
library(datasets)
library(ggplot2)

shinyServer(function(input, output) {
  
  datas <- reactive({
    #diamonds[sample(nrow(diamonds), input$sampleSize),]
    switch(input$dataset,
           "iris" = iris,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars,
           "diamonds"= diamonds,
           "mtcars"= mtcars)
           #"yours" = read.csv("actdb.csv",header=TRUE,sep=","))
  })
  
  output$plot <- renderPlot({
    
    namen <- names(datas())
    p <- ggplot(datas(), aes_string(x=namen[input$x], y=namen[input$y])) + geom_point()
    
    if (input$color != 'None')
      p <- p + aes_string(color=namen[input$color])
    
    #facets <- paste(input$facet_row, '~', input$facet_col)
    #if (facets != '. ~ .')
    #  p <- p + facet_grid(facets)
    
    #if (input$jitter)
    #  p <- p + geom_jitter()
    #if (input$smooth)
    #  p <- p + geom_smooth()
    
    print(p)
    
  }, height=700)
  
})
