library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Marian's First Shiny App!"),
    
    # Allow user to input/select dataset
    selectInput("dataset", 
                label = "Dataset", 
                choices = ls("package:datasets")),
    
    # show output of summary and table
    verbatimTextOutput("summary"),
    tableOutput("table")
  )


# Define server logic
server <- function(input, output, session) {
  # Create a reactive expression
  dataset <- reactive({
    get(input$dataset, "package:datasets")
  })
  
  output$summary <- renderPrint({
    # Use a reactive expression by calling it like a function
    summary(dataset())
  })
  
  output$table <- renderTable({
    dataset()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
