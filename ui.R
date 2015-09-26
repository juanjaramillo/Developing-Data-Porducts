library(shiny)
library(ggplot2)
library(datasets)

dataset <- diamonds

shinyUI(pageWithSidebar(
  
  headerPanel("Dataset Explorer"),
  
  sidebarPanel(
    selectInput("dataset", "Choose a dataset:", 
                choices = c("iris", "rock", "pressure", "cars","diamonds","mtcars","yours")),
    #dataset <- datas,
    #sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
    #            value=min(1000, nrow(dataset)), step=500, round=0),
    numericInput("x", label = h4("X variable"), value = 1, min=1),
    numericInput("y", label = h4("Y variable"), value = 2, min=1),
    numericInput("color", label = h4("Color"), value = 3, min=1)
    #selectInput('x', 'X Variable', names(dataset)),
    #selectInput('y', 'Y Variable', names(dataset), names(dataset)[[2]]),
    #selectInput('color', 'Color', c('None', names(dataset))),
    
    #checkboxInput('jitter', 'Jitter'),
    #checkboxInput('smooth', 'Smooth'),
    
    #selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
    #selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
  ),
  
  mainPanel(
    plotOutput('plot')
  )
))
