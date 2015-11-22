
library(shiny)

data <- read.csv("consumption.csv", sep=",", header=T)
colnames(data)[2] <- "Print"
colnames(data)[3] <- "Online"
colnames(data)[4] <- "Print n Online"

## Define a server for the Shiny app
shinyServer(function(input, output) {
  
  dataInput <- reactive({
    subset(data, select=c(input$package), subset=(substring(data$Date,1,4) == input$year))
  })
  
  ## Fill in the spot we created for a plot
  output$plot1 <- renderPlot({
    
    ## Render a barplot
    barplot(dataInput()[,input$package],
            main=paste(input$package, "in", input$year),
            ylab="Subcription (in '000 AUD)", ylim=c(0,80),
            xlab="Weeks (Jan to Dec)")
  })
})
