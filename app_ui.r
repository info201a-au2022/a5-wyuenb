# A5 app_ui.r

# Intro tab
intro_view <- tabPanel(
    "Introduction",
    sidebarLayout(
        sidebarPanel(
            h1(strong("CO2 Emissions")),
            h2("by William Yuen")
        ),
        mainPanel(
            h2(strong("Topic Introductions")),
            img("", src = "https://assets.newatlas.com/dims4/default/e8a4c6d/2147483647/strip/true/crop/1619x1079+0+0/resize/1200x800!/quality/90/?url=http%3A%2F%2Fnewatlas-brightspot.s3.amazonaws.com%2Farchive%2Fco2-coal-3.jpg",
                width = "400", height = "200", align = "center"),
            textOutput("value_2"),
            textOutput("value_3"),
            textOutput("value_1"),
            textOutput("value_4"),
            br(),
            p("These are just several facts about Carbon Dioxide (CO2)
              emissions. An excess of greenhouse gasses in the earth's
              atmosphere such as CO2 are harmful to the earth because it results
              in climate change and a rising of earth's average temperature. In
              this project, I analyze the trends of CO2 emissions of every
              country and across the globe, exposing patterns of CO2 emissions.
              Specifically, I will analyze the variables population and CO2
              emissions for every country. I want to see how much CO2 every
              country is emiting per person based on the year. I got the data
              from an organization called Our World In Data. In the Interactive
              Graph tab, I have posted an interactive graph to visualize the
              data that includes two widgets.")
        )
    )
)

# Chart fluid page
chart_fluid <- fluidPage(
  titlePanel(strong("How much CO2 does each country produce in proportion to
            their population?")),
  
  mainPanel(
    plotlyOutput("chart"),
    hr(),
    p("This is a choropleth map that shows the amount of co2 produced each
      year in proportion to population by year. The darker the red, the more co2
      that country produced proportional to their population, and vice versa. I
      included this chart because co2 emissions are the main subject in interest
      for this assignment, and instead of showing the total co2 emitted by each
      country, it is more valuable information to know how much co2 was produced
      by each person, hence the proportional aspect. Some patterns that emerged
      as I explored the chart was that all the countries were in the gray or
      light red up until the 20th century when the United States and some of
      Europe started emitted more CO2. Based on previous knowledge, this was the
      result of more CO2 being emitted from the Industrial Revolution. Another
      pattern I noticed was that by 2021, the countries that were darker red
      were mostly developed first and second world countries. In the interactive
      map, there are two widgets: a slider that controls the year, and a play
      button that animates the map and passes through every year so that you can
      watch how the co2 emissions have changed from 1750 to 2021. If you hover
      over any country, the first number is the average amount of co2 (in tons)
      that was emitted by every person in that country for the year shown. The
      second number shows the population of that country. Finally, you can zoom
      in and out by scrolling on the map.")
  )
)

# Interactive chart tab
chart_view <- tabPanel(
  "Interactive Visualization",
  chart_fluid
)

# Define UI
ui <- navbarPage(
    "CO2 Emissions",
    intro_view,
    chart_view
)