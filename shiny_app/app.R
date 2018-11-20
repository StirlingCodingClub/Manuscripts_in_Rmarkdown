# Example web app plotting Bumpus measurements
library(shiny);

# Define UI for application that draws a histogram
ui <- fluidPage(
   # Application title
   titlePanel("Histograms of Bumpus measurements"),
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
          radioButtons(inputId = "radio", label = "",
                       choices = list("Humerus"     = 7, 
                                      "Femur"       = 8,
                                      "Tibiotarsus" = 9,
                                      "Skull"       = 10,
                                      "Sternum"     = 11),
                       inline   = FALSE, 
                       width    = '800px', 
                       selected = 7)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("bumpusplot")
      )
   )
);

# Define server logic required to draw a histogram
server <- function(input, output) {
   dat <- read.csv(file = "../data/Bumpus_data.csv");
   output$bumpusplot <- renderPlot({
       n_col <- as.numeric(input$radio);
       par(mar = c(5, 5, 1, 1));
       hist(x = dat[, n_col], main = "", xlab = "Measurement value (mm)",
            ylab = "Frequency", cex.lab = 1.5, cex.axis = 1.5, col = "blue");
   })
}

# Run the application 
shinyApp(ui = ui, server = server);