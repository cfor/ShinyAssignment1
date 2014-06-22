library(shiny)

# ui.R

shinyUI(fluidPage(
  titlePanel("Simple Metric Converter"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Convert values from Metric to Imperial"),
      
      selectInput("var", 
                  label = "Choose a measure to display",
                  choices = list("Mass","Length"),
                  selected = "Length"),
      
      sliderInput("range", 
                  label = "Range:",
                  min = 0, max = 100, value = c(0))
    ),
    
    mainPanel(
      h1(textOutput("convText")),
      h2(textOutput("convText2")),
      textOutput("convText3"),
      
      helpText(""),
      HTML("<p3>Instructions:</p3>"),
      
      helpText("", 
               "1. Select a unit of measure from the pull down list"),
      helpText("2. Move the slider bar to the number of units to convert"),
      helpText("converted value will be displayed")
    )
  )
))
