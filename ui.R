
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Analyze Cement Hardness")

  
  # Show a plot of the generated distribution
  ,plotOutput("distPlot")
  ,fluidRow(
    htmlOutput("showInstructions")
  )
  ,h3("Configuration")  
  ,fluidRow(
      column(2
            ,radioButtons("instructionsYN"
                          , label = "Show Instructions"
                          , choices = c("Yes","No")
                          , selected = "Yes")
      )
      , column(4
               ,selectInput("outputType", "Select the output graph type",
                            choices = c("Histogram","Scatter Plot")) 
               ,selectInput("regressorCol"
                            , "Select the Regressor"
                            , choices = c("Water"
                                          , "Cement"
                                          , "BlastFurnaceSlag"
                                          , "FlyAsh"
                                          , "CoarseAggregate"
                                          , "Superplasticizer"
                                          , "FineAggregate"
                                          , "Age"))
               ,numericInput("seedVal","Seed Value", 975, min = 0)
      )
      ,column(4
              ,sliderInput("dataCut",
                           "% of Test Data:",
                           min = 10,
                           max = 90,
                           value = 50)
              
              ,htmlOutput("sliderInputUI")
       )

  )
))
