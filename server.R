library(shiny)

shinyServer(function(input, output) {
  
  values <- reactiveValues()

  observe({
    input$action_odds
    values$int <- isolate({
      as.numeric(input$num_belief) * as.numeric(input$num_chimney) * as.numeric(input$num_naughty)
    })
  })
 

  output$str_odds <- renderText({

     if (values$int == 0) {
       paste("Unfortunately, there's not a chance you are getting anything!")
     }
     else if (values$int >= 1 & values$int < 6 ) {
       paste("There's something for you. Just don't expect something out of this world.")
     }
     else if (values$int >= 6 & values$int <= 11) {
       paste("You are doing great! Santa would be delivering your present personally - either by sleight, or DHL.")
     }
     else if (values$int == 12) {
       paste("You are definitely getting what you wish for this Christmas! And perhaps a BIG surprise as well.  Merry Christmas!")
     }

  })
})
