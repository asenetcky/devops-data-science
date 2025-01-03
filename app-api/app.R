library(shiny)
library(log4r)

config <- config::get()

log <- log4r::logger()

log4r::info(log, "App Started")

api_url <- "http://127.0.0.1:8080/predict"

ui <- fluidPage(
  titlePanel("Penguin Mass Predictor"),

  # Model input values
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "bill_length",
        "Bill Length (mm)",
        min = config$min,
        max = config$max,
        value = 45,
        step = 0.1
      ),
      selectInput(
        "sex",
        "Sex",
        c("male", "female")
      ),
      selectInput(
        "species",
        "Species",
        c("Adelie", "Chinstrap", "Gentoo")
      ),
      # Get model predictions
      actionButton(
        "predict",
        "Predict"
      )
    ),

    mainPanel(
      h2("Penguin Parameters"),
      verbatimTextOutput("vals"),
      h2("Predicted Penguin Mass (g)"),
      textOutput("pred")
    )
  )
)

server <- function(input, output) {
  # Input params
  vals <- reactive(
    dplyr::tibble(
      bill_length_mm = input$bill_length,
      species = input$species,
      sex = input$sex
    )
  )

  pred <- eventReactive(
    input$predict,
    {
      log4r::info(log, "Prediction Requested")

      r <- httr2::request(api_url) |>
        httr2::req_body_json(vals()) |>
        httr2::req_perform()

      log4r::info(log, "Prediction Returned")

      if (httr2::resp_is_error(r)) {
        log4r::error(log, paste("HTTP Error"))
      }

      httr2::resp_body_json(r)
    },
    ignoreInit = TRUE
  )

  # Render to UI
  output$pred <- renderText(pred()$.pred)
  output$vals <- renderPrint(vals())
}

# Run the application
shinyApp(ui = ui, server = server)

