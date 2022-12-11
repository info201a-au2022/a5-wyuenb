# A5 app-server.r
library("tidyverse")

# Load dataset
co2_data <- read.csv("./owid-co2-data.csv")

# Server function
server <- function(input, output) {
    # First dplyr value: Which country produced the most co2 in 2021?
    output$value_1 <- renderText({
        most_co2 <- co2_data %>%
          filter(year == 2021) %>%
          filter(iso_code != "") %>% 
          arrange(-co2) %>%
          head(1) %>% 
          pull(country)
        par1 <- paste0("The country that produced the most CO2 in 2021 was ",
                       most_co2, ".")
    return(par1)
    })
    
    # Second dplyr value: How much CO2 was produced in 2021?
    output$value_2 <- renderText({
      total_co2 <- co2_data %>%
        filter(year == 2021) %>%
        filter(iso_code != "") %>%
        summarize(co2_totals = sum(co2, na.rm = TRUE)) %>%
        pull(co2_totals)
      par2 <- paste0("In 2021, there were ", total_co2, " millions of
                     tons of CO2 produced.")
    return(par2)
    })
    
    # Third dplyr value: How much more co2 was produced in 2021 than 50 years ago in 1971?
    output$value_3 <- renderText({
      total_co2 <- co2_data %>%
        filter(year == 2021) %>%
        filter(iso_code != "") %>%
        summarize(co2_totals = sum(co2, na.rm = TRUE)) %>%
        pull(co2_totals)
      total_co2_1971 <- co2_data %>%
        filter(year == 1971) %>%
        filter(iso_code != "") %>%
        summarize(co2_totals = sum(co2, na.rm = TRUE)) %>%
        pull(co2_totals)
      
      difference <- total_co2 - total_co2_1971
      par3 <- paste0("In 50 years, from 1971 to 2021, there was a difference of ", difference,
                     " millions of tons of CO2 produced each year.")
      return(par3)
    })
    
    # Additional dplyr value: How much co2 did China produce in 2021?
    output$value_4 <- renderText({
      china_co2 <- co2_data %>%
        filter(year == 2021) %>%
        filter(iso_code != "") %>% 
        arrange(-co2) %>%
        head(1) %>% 
        pull(co2)
      par4 <- paste0("China produced ", china_co2, " millions of tons of CO2
                     in 2021.")
      return(par4)
    })
    
    # Plotly chart
    output$chart <- renderPlotly({
      plot <- plot_geo(co2_data %>%
                         filter(iso_code != "") %>%
                         mutate(co2_units = co2 * 1000000) %>%
                         mutate(ratio = co2_units / population) %>%
                         mutate(pop_text = paste0("Population: ", population)),
                       frame = ~year) %>%
        add_trace(locations = ~iso_code,
                  z = ~ratio,
                  zmin = 0,
                  zmax = 20,
                  color = ~ratio,
                  colorscale = '-Greens',
                  text = ~pop_text) %>%
        layout(title = "Amount of CO2 Emitted Each Year Proportional to Population") %>%
        config(displayModeBar = FALSE)
      return(plot)
    })
    
}

