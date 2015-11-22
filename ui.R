library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(
    
    # Give the page a title
    titlePanel("Subscription of Print / Online / Print & Online packages over one year"),
    
    # Generate a row with a sidebar
    sidebarLayout(
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("package", "Type of subscription:",
                    choices=c("Print", "Online", "Print n Online")),
        selectInput("year", "Year:",
                    choices=c("2011", "2012", "2013","2014", "2015")),
        hr(),
        helpText("Data of Magazine subscription since 2011.", br(),
                 "Select the type of subscription and the year to get the appropriate bar plot.")),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("plot1")))))
