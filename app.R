#Workout 2
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyr)

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Investment Simulation"),
  
  # Top part with slider panels
  fluidRow(
    column(4,
           sliderInput("initial",
                       "Initial Amount",
                       min = 0,
                       max = 100000,
                       step = 50,
                       value = 1000)),
    column(4,
           sliderInput("return_rate", 
                       "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 5)),
    column(4,
           sliderInput("years",
                       "Years",
                       min = 0,
                       max =  50,
                       step = 1,
                       value = 20))
  ),
  fluidRow(
    column(4, 
           sliderInput("annuity", 
                       "Annual Contribution", 
                       min = 0,
                       max = 50000,
                       step = 500,
                       value = 2000)),
    column(4,
           sliderInput("growth_rate", 
                       "Growth Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 2)),
    column(4,
           selectInput("facet", 
                       "Facet?",
                       choices = c("Yes", "No"),
                       selected = "No"))
  ),
  fluidRow(
    plotOutput("timeline")
  ),
  fluidRow(
    verbatimTextOutput("balances")
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  #' @title future value
  #' @description calculates the future value of an investment, assuming compound interest
  #' @param amount the initial invested amount
  #' @param rate the annual rate of return of the investment
  #' @param years the number of years
  #' @return the computed future value of an investment
  
  future_value <- function(amount, rate, years){
    fv <- amount*(1+rate)^years
    return(fv)
  }
  
  #' @title annuity
  #' @description calculates the future value of annuity
  #' @param contrib the annual contributed amount
  #' @param rate the annual rate of return
  #' @param years the number of years
  #' @return the computed future value of annuity
  
  annuity <- function(contrib, rate, years){
    fva <- contrib*(((1+rate)^years - 1)/rate)
    return(fva)
  }
  
  #' @title growing annuity
  #' @description calculates the future value of a growing annuity
  #' @param contrib the annual contributed amount
  #' @param rate the annual rate of return
  #' @param growth the annual growth rate of the annuity
  #' @param years the number of years
  #' @return the computed future value of annuity
  
  balances <- reactive({
    return(balances1)
  })
  
  
  output$timeline <- renderPlot({

    growing_annuity <- function(contrib, rate, growth, years){
      fvga <- contrib*(((1+rate)^years - (1+growth)^years)/(rate-growth))
      return(fvga)
    }
    
    no_contrib <- c()
    for (i in 0:input$years){
      no_contrib <- c(no_contrib, future_value(input$initial,input$return_rate/100,i))
    }
    
    fixed_contrib <- c()
    for (i in 0:input$years){
      fixed_contrib <- c(fixed_contrib, future_value(input$initial, input$return_rate/100, i) + annuity(input$annuity,input$return_rate/100,i))
    }
    
    growing_contrib <- c()
    for (i in 0:input$years){
      growing_contrib <- c(growing_contrib, future_value(input$initial, input$return_rate/100, i) + growing_annuity(input$annuity,input$return_rate/100, input$growth_rate/100, i))
    }
    
    year <- c(seq(0, input$years, 1))
    
    balances <- data.frame(year, no_contrib, fixed_contrib, growing_contrib)
    balances1 <- gather(balances, key="variable", value="value", c("no_contrib", "fixed_contrib", "growing_contrib"))
    balances1$variable <- factor(balances1$variable, levels = c("no_contrib", "fixed_contrib", "growing_contrib"))
    if (input$facet == 'No'){
      ggplot(balances1, aes(x = year, y = value, col = variable)) + geom_line() +  geom_point() + scale_colour_discrete(name = "variable") + labs(x = "year", y = "value", title = "Three modes of investing")
    } else {
      ggplot(balances1, aes(x = year, y = value, col = variable)) + geom_line() +  geom_point() + scale_colour_discrete(name = "variable") + labs(x = "year", y = "value", title = "Three modes of investing") + geom_area(aes(fill= variable), alpha = 0.5) + facet_wrap(~variable)
    }
  })
    
    output$balances <- renderPrint({
      growing_annuity <- function(contrib, rate, growth, years){
        fvga <- contrib*(((1+rate)^years - (1+growth)^years)/(rate-growth))
        return(fvga)
      }
      
      no_contrib <- c()
      for (i in 0:input$years){
        no_contrib <- c(no_contrib, future_value(input$initial,input$return_rate/100,i))
      }
      
      fixed_contrib <- c()
      for (i in 0:input$years){
        fixed_contrib <- c(fixed_contrib, future_value(input$initial, input$return_rate/100, i) + annuity(input$annuity,input$return_rate/100,i))
      }
      
      growing_contrib <- c()
      for (i in 0:input$years){
        growing_contrib <- c(growing_contrib, future_value(input$initial, input$return_rate/100, i) + growing_annuity(input$annuity,input$return_rate/100, input$growth_rate/100, i))
      }
      
      year <- c(seq(0, input$years, 1))
      
      balances <- data.frame(year, no_contrib, fixed_contrib, growing_contrib)
      balances
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

