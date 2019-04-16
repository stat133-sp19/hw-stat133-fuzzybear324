#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(DT)
library(reshape2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Project Balance with Different Saving Methods"),
   
   
   #Make first row in ui
   fluidRow(
     column(3,
       sliderInput("amount",
                   "Initial Amount:",
                   min = 0,
                   max = 100000,
                   step = 500,
                   pre = "$", 
                   value = 1000
       ),
       sliderInput("contrib",
                   "Annual Contribution:",
                   min = 0, 
                   max = 50000,
                   step = 500,
                   pre = "$",
                   value = 2000
       )
     ),
     column(4,
            sliderInput("rate",
                        "Return rate (in %)",
                        min = 0,
                        max = 20,
                        step = 0.1,
                        post = "%",
                        value = 5
            ),
            sliderInput("growth",
                        "Growth rate (in %)",
                        min = 0,
                        max = 20,
                        step = 0.1,
                        post = "%",
                        value = 2
            )

     ),
     column(5,
            sliderInput("years",
                          "Years",
                          min = 0,
                          max = 50,
                          step = 1,
                          value = 20
     ),
     selectInput(inputId = "facet_option",
                 label = "Facet?",
                 choices = c("No", "Yes")
                 
     )
    )
  ), #closes fluid row
   
  # Make space for datatable
  plotOutput("distPlot"),
  DTOutput("table")

)

#
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    #Initialize variables
    amount <- input$amount
    rate <- input$rate/100
    years <- input$years
    contrib <- input$contrib
    growth <- input$growth/100
    facet_option <- input$facet_option
    
    #creating functions
    future_value <- function(amount, rate, years) {
      fv <- amount*(1+rate)^years
      return(fv)
    }
    annuity <- function(contrib, rate, years) {
      fva <- contrib*(((1+rate)^years - 1)/rate)
      return(fva)
    }
    growing_annuity <- function(contrib, rate, growth, years) {
      fvga <- contrib * (((1+rate)^years - (1+growth)^years)/(rate-growth))
      return(fvga)
    }
    
    #creating the dataframe of the modals
    
    modalities <- data.frame()
    for(i in 0:years) {
      temp_dat <- c()
      temp_dat <- c(temp_dat, i)
      
      mode1 <- future_value(amount = amount, rate = rate, years = i)
      temp_dat <- c(temp_dat, mode1)
      
      mode2 <- annuity(contrib = contrib, rate = rate, years = i)+mode1
      temp_dat <- c(temp_dat, mode2)
      
      mode3 <- growing_annuity(contrib = contrib, rate = rate, growth = growth, years = i)+mode1
      temp_dat <- c(temp_dat, mode3)
      
      modalities <- rbind(modalities, temp_dat)
    }
    colnames(modalities) <- c("year", "no_contrib", "fixed_contrib", "growing_contrib")
    
    #Making the graph
    
    if(facet_option == "No") {
      ggplot(data = modalities) +
        geom_line(aes(x = modalities$year, y = no_contrib, color = "red")) + 
        geom_point(aes(x = modalities$year, y = no_contrib, color = "red")) +
        geom_line(aes(x = modalities$year, y = fixed_contrib, color = "blue")) + 
        geom_point(aes(x = modalities$year, y = fixed_contrib, color = "blue")) +
        geom_line(aes(x = modalities$year, y = growing_contrib, color = "green")) +
        geom_point(aes(x = modalities$year, y = growing_contrib, color = "green")) +
        ggtitle("Three Modes of Investing") +
        xlab("Year") +
        ylab("Value") +
        xlim(0, years) +
        #ylim(0, 5000) +
        scale_x_continuous(breaks = seq(0, years, years/10)) +
        scale_color_identity(name = "Variable",
                             breaks = c("red", "blue", "green"),
                             labels = c("No Contrib", "Fixed Contrib", "Growing Contrib"),
                             guide = "legend")
    } else if(facet_option == "Yes") {
      
      #facet graph
      
      melt_modalities <- melt(modalities, id = c("year"))
      
      ggplot(data = melt_modalities, aes(x = melt_modalities$year, y = melt_modalities$value)) +
        geom_point(aes(x = melt_modalities$year, y = melt_modalities$value, color = melt_modalities$variable)) +
        geom_area(aes(x = melt_modalities$year, y = melt_modalities$value, color = melt_modalities$variable, fill = melt_modalities$variable), alpha = 0.6) +
        
        scale_x_continuous(limits = c(0, nrow(melt_modalities)/3)) +
        
        xlab("Year") +
        ylab("value") +
        ggtitle("Three modes of investing") +
        
        theme_light()+
        
        facet_wrap(~ variable)
      
    }
    
  })
  
  #creating datatable
  
  output$table <- DT::renderDataTable({
    
    #Initializing variables
    amount <- input$amount
    rate <- input$rate/100
    years <- input$years
    contrib <- input$contrib
    growth <- input$growth/100
    
    #creating functions
    future_value <- function(amount, rate, years) {
      fv <- amount*(1+rate)^years
      return(fv)
    }
    annuity <- function(contrib, rate, years) {
      fva <- contrib*(((1+rate)^years - 1)/rate)
      return(fva)
    }
    growing_annuity <- function(contrib, rate, growth, years) {
      fvga <- contrib * (((1+rate)^years - (1+growth)^years)/(rate-growth))
      return(fvga)
    }
    
    #creating the dataframe of the modals
    modalities <- data.frame()
    for(i in 0:years) {
      temp_dat <- c()
      temp_dat <- c(temp_dat, i)
      
      mode1 <- future_value(amount = amount, rate = rate, years = i)
      temp_dat <- c(temp_dat, mode1)
      
      mode2 <- annuity(contrib = contrib, rate = rate, years = i)+mode1
      temp_dat <- c(temp_dat, mode2)
      
      mode3 <- growing_annuity(contrib = contrib, rate = rate, growth = growth, years = i)+mode1
      temp_dat <- c(temp_dat, mode3)
      
      modalities <- rbind(modalities, temp_dat)
    }
    colnames(modalities) <- c("year", "no_contrib", "fixed_contrib", "growing_contrib")  
    
    datatable(modalities, options = list(dom = 't'))
  })
     
}

# Run the application 
shinyApp(ui = ui, server = server)

