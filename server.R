library(shiny)

shinyServer(
  function(input, output) {
    
    output$convText <- renderText({ 
      paste("Converting", input$var)
    })
    
    output$convText2 <- renderText({ 
      paste("Multiplier:",  switch(input$var, 
                                   "Mass" = "1 Kilogram is 2.20462 pounds",
                                   "Length" = "1 centimetre is 0.393700787 inches") 
      )
    })
    
    x <- reactive(as.numeric(input$range))    # x is input value
    m <- reactive(switch(input$var,           # m is multiplier 
                         "Mass" = 2.20462,
                         "Length" = 0.393700787) )
    s1 <- reactive(switch(input$var,           # s1 is from unit abbreviation 
                          "Mass" = "Kgs",
                          "Length" = "Cms"))
    
    s2 <- reactive(switch(input$var,           # s2 is to unit abbreviation 
                          "Mass" = "Lbs",
                          "Length" = "Inches"))
    
    output$convText3 <- renderText({ 
      paste("Thus", sprintf("%d %s by %f is %f %s", x(),s1(),m(), x()*m(), s2()  )  )
    })
    
  }
)
