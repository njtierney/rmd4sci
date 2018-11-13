oz_gapminder <- filter(gapminder, country == "Australia")

write_csv(oz_gapminder, "data/oz_gapminder.csv")
