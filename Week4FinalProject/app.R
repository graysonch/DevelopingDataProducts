#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# This is a project created for the final week of the Coursera Course
# Developing Data Products. 
# This was created and written by Christine Grayson 11/05/2021

library(shiny)
library(rjson)
library(jsonlite)
library(dplyr)
library(lubridate)
library(plotly)
library(networkD3)
library(tidyverse)

smfile = "data/social_media_data_byhand.csv"
if(file.exists(smfile)) {
    sm_data <- read.csv(file=smfile)
    
} else {
    print("No data, exiting!")
}
sm_data$date <- ymd_hms(sm_data$date)
datex1 = as.Date(floor_date(min(sm_data$date), "days"))
datex2 = as.Date(ceiling_date(max(sm_data$date), "days"))

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Social Media Network Study"),
    h5("Christine Grayson - 11-05-2021"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderx",
                        "Pick Minimum and Maximum date Values",
                        min = datex1,
                        max = datex2,
                        value=c(datex1, datex2),
                        timeFormat='%d-%m-%y'),
            plotlyOutput("distPlot"),
            h5(textOutput("s1"),textOutput("s2"))
        ),
        mainPanel(
            # Show a plot of the generated distribution
            h3("Network of Selected Events"),
            forceNetworkOutput(outputId = "net"),
            em(textOutput("stats"))
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlotly({
        
        vline <- function(x = 0, color = "red") {
            list(
                type = "line", 
                y0 = 0, 
                y1 = 1, 
                yref = "paper",
                x0 = x, 
                x1 = x, 
                line = list(color = color)
            )
        }
        
        sl <- input$sliderx[1] - hours(12)
        sr <- input$sliderx[2] - hours(12)
        
        event_plot <- sm_data %>%
            #plot_ly(x = ~(as.numeric(date) * 1000), type = 'histogram', nbinsx = input$bins)  %>%
            plot_ly(x = ~as.Date(date), type = 'histogram', nbinsx = 29)  %>%
            layout(title = "Number of Social Media Events Over Time",
                   shapes = list(vline(sl),vline(sr)),
                   coloraxis=list(colorscale='RdBu'), 
                   showlegend = FALSE, 
                   plot_bgcolor='#D3D3D3',
                   font = list(family = 'Arial',
                               size = 10,
                               color = '#000000'),
                   xaxis = list( 
                       range=c(datex1 - hours(12),datex2 - hours(12)),
                       type="date",
                       tickformat = '%d-%m-%y',
                       title = 'Date',
                       zerolinecolor = '#ffff', 
                       zerolinewidth = 2,
                       gridcolor = 'ffff'), 
                   yaxis = list( 
                       type = "log",
                       title = 'Event Count (log)',
                       axis_tickformat = "0.1r",
                       zerolinecolor = '#ffff', 
                       zerolinewidth = 2, 
                       gridcolor = 'ffff'))
        
    })
    
    output$net <- renderForceNetwork({
        
        output$s1 <- renderText({ paste0("Selected Range: ",format(input$sliderx[1],"%Y-%m-%d %H:%M:%S"),
                                         " - ",format(input$sliderx[2],"%Y-%m-%d %H:%M:%S")) })
        sub_sm <- sm_data[sm_data$date >= input$sliderx[1] & sm_data$date < input$sliderx[2],]
        output$nume <- renderText(paste0("rows: ", nrow(sub_sm)))
        
        # create node list
        sources <- sub_sm %>%
            distinct(parent) %>%
            rename(label = parent)
        
        destinations <- sub_sm %>%
            distinct(child) %>%
            rename(label = child)
        
        nodes <- full_join(sources, destinations, by = "label")
        nodes <- nodes %>% rowid_to_column("id")
        #nodes
        
        # create edge list
        event_edgelist <- sub_sm %>%  
            group_by(parent, child) %>%
            summarise(weight = n()) %>% 
            ungroup()
        
        edges <- event_edgelist %>% 
            left_join(nodes, by = c("parent" = "label")) %>% 
            rename(from = id)
        
        edges <- edges %>% 
            left_join(nodes, by = c("child" = "label")) %>% 
            rename(to = id)
        
        edges <- select(edges, from, to, weight)
        output$stats <- renderText(paste0("nodes: ", nrow(nodes), " edges: ", nrow(edges)))
        #edges
        
        nodes_d3 <- mutate(nodes, id = id - 1)
        edges_d3 <- mutate(edges, from = from - 1, to = to - 1)
        
        forceNetwork(Links = edges_d3, Nodes = nodes_d3, Source = "from", Target = "to", 
                     NodeID = "label", Group = "id", Value = "weight", 
                     opacity = 1, fontSize = 16, zoom = TRUE)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
