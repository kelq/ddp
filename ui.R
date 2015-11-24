library(shiny)

shinyUI(fluidPage(
  titlePanel("Would you be getting a Christmas present this year?"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("This app estimates the probability that you will receive a Christmas present this year."),            
      br(),            

      sliderInput("num_belief", label = h5("How much do you believe in Santa Claus?
                                           (0 - Don't believe, 4 - Absolutely worships him"), min=0, max=4, value=2),
      br(),     
      
      selectInput("num_naughty", label = h5("How naughty have you been this year?"), 
                  choices = list("Absolutely criminal" = 0, "Bordering on breaking the law" = 1, "Cheeky at times" = 2, "As obedient as a dog" = 3),
                  selected = 3),
      br(),            
      
      radioButtons("num_chimney", label = h5("Do you have a chimney or some other way that Santa could get in?"), choices=list("Yes" = 1, "No" = 0), selected = 1),
      br(),

      br(),            
      actionButton("action_odds", label = "Compute my odds!")        
      ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Your Odds",
                 br(),
                 textOutput("str_odds")
        ),
        tabPanel("Documentation",
                 p(h4("Would you get a Christmas Present?")),
                 br(),
                 helpText("This app estimates the probability that you will receive a Christmas present this year."),
                 HTML("<br>The odds are computed from:<br><br>
                      - <b>Whether you believe in Santa Claus</b><br>
                        <i>Slide the slider to indicate your level of belief. The higher the belief, the more you slide to the right.</i> <br><br>

                      - <b>Whether you have been naughty this year</b><br>
                        <i>Information will be kept strictly confidential.</i><br><br>
 
                      - <b>Whether you have a chimney, or something similar for Santa to handover the present</b><br>
                        <i>e.g. Something similar could be a big mailbox, UberRUSH</i><br>
                        <i>If not, you are definitely out of luck. Try asking your parents. </i><br><br>
                      ")                
                 ))))))
