library(ggplot2)
library(dplyr)


## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

plotdata <- NEI %>% filter(fips == "24510") %>% group_by(year, type) %>% select(year, Emissions, type) %>% summarize(totalemission=sum(Emissions))

g <- ggplot(data=plotdata, aes(year, totalemission))
g + geom_line(aes(color=type)) + labs(title="Emission in Baltimore for different types of sources", x="Year", y="Total emission [tons]")
ggsave("plot3.png", width=4.80, height=4.80, dpi=100)

## Alternatively use facets:
g + geom_line() + 
    facet_grid(. ~ type)
    labs(title="Emission in Baltimore for different types of sources", x="Year", y="Total emission [tons]")
