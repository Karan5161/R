library(ggplot2)

data(mpg)
view(mpg)

# plain canvas
ggplot()

# with axis
ggplot(mpg, aes(x = displ, y = hwy))

# with values using geom_point
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(mpg, aes(displ, hwy)) + geom_point()


ggplot(mpg, aes(displ, cty, colour = class)) +
  geom_point()

ggplot(mpg, aes(displ, cty, shape = drv)) +
  geom_point()

ggplot(mpg, aes(displ, cty, size = cyl)) +
  geom_point()

ggplot(mpg, aes(displ, cty, colour = class, shape = drv)) +
  geom_point()

ggplot(mpg, aes(displ, hwy)) + geom_point(colour = "Blue")

-------------------------------------------------------------

#facetting
# to display multiple chart

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~class)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth()

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(se = F)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span = 0.2)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span = 0.2, se = F)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~year)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~class)


ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(method = "gam", formula = y ~ s(x))

ggplot(mpg, aes(drv, hwy)) +
  geom_point()

ggplot(mpg, aes(drv, hwy)) +
  geom_jitter()


ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.1)

ggplot(mpg, aes(drv, hwy, colour = class)) +
  geom_jitter(width = 0.1)


ggplot(mpg, aes(drv, hwy)) +
  geom_boxplot()

ggplot(mpg, aes(drv, hwy)) +
  geom_violin()

ggplot(mpg, aes(hwy)) +
  geom_histogram()

ggplot(mpg, aes(hwy)) +
  geom_freqpoly()

ggplot(mpg, aes(hwy)) +
  geom_freqpoly(binwidth = 2.5)


ggplot(mpg, aes(hwy)) +
  geom_freqpoly(binwidth = 1)

ggplot(mpg, aes(displ, colour = drv)) +
  geom_freqpoly(binwidth = 0.5)

ggplot(mpg, aes(displ, fill = drv)) +
  geom_freqpoly(binwidth = 0.5) +
  facet_wrap(~drv, ncol = 1)

ggplot(mpg, aes(displ, fill = drv)) +
  geom_freqpoly(binwidth = 0.5) +
  facet_wrap(~drv, ncol = 2)

ggplot(mpg, aes(manufacturer)) + geom_bar()

------------------------------------------------

#to understand barchart in depth

drugs <- data.frame(
  drug = c("a", "b", "c"),
  effect = c(4.2, 9.7, 6.1)
)


ggplot(drugs, aes(drug, effect)) +
  geom_bar(stat = "identity")


data("economics")
ggplot(economics, aes(date, unemploy / pop)) +
  geom_line()
ggplot(economics, aes(date, uempmed)) +
  geom_line()

year <-  function(x) as.POSIXlt(x)$year + 1900
ggplot(economics, aes(unemploy / pop, uempmed)) +
  geom_path(colour = "grey50") +
  geom_point(aes(colour = year(date)))

ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 0.1)

ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3) +
  xlab("City driving (mpg)") +
  ylab("Hoghway driving (mpg)")

ggplot(mpg, aes(cty, hwy)) +
  geom_point(alpha = 1 / 3) +
  xlab(NULL) +
  ylab(NULL)

ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.25) +
  xlim("f", "r") +
  ylim(20, 30)


ggplot(mpg, aes(drv, hwy)) +
  geom_jitter(width = 0.25, na.rm = T) +
  ylim(NA, 30)

p <- ggplot(mpg, aes(displ, hwy, colour = factor(cyl))) +
  geom_point()

p

--------------------------------------------------------

# to save the data or plot

saveRDS(p, "plot.rds")

getwd()


ggsave("plot.png", width = 8, height = 5, dpi = 300)

summary(p)


df <- data.frame(
  x = c(3,1,5),
  y = c(2,4,6),
  label = c("a", "b", "c")
)

p <- ggplot(df, aes(x, y, label = label)) +
  labs(x = NULL, y = NULL) +
  theme(plot.title = element_text(size = 12))
p

p + geom_point() + ggtitle("Point")
p + geom_text() + ggtitle("Text")
p + geom_bar(stat = "Identity") + ggtile("Bar")
p + geom_tile() + ggtitle("Raster")
p + geom_line() + ggtitle("Line")
p + geom_area() + ggtitle("Area")
p + geom_path() + ggtitle("Path")
p + geom_polygon() + ggtitle("Polygon")


df <- data.frame(x = 1, y = 3.1, face = c("plain", "bold", "italic"))
ggplot(df, aes(x, y)) +
  geom_text(aes(label = face, fontface = face))
df


ggplot(mpg, aes(class, fill = drv)) +
  geom_bar()

ggplot(mpg, aes(class, fill = drv)) +
  geom_bar(position = "stack")

ggplot(mpg, aes(class, fill = drv)) +
  geom_bar(position = "dodge")

ggplot(mpg, aes(class, fill = drv)) +
  geom_bar(position = "fill")

ggplot(mpg, aes(class, fill = drv)) +
  geom_bar(position = "identity", alpha = 1/2, colour="grey50")

ggplot(mpg, aes(class, fill = hwy)) +
  geom_bar(position = "stack")

ggplot(mpg, aes(class, fill = hwy, group = hwy)) +
  geom_bar(position = "stack")

ggplot(mpg, aes(drv, hwy)) +
  geom_boxplot() +
  geom_line(colour = "#3366FF", alpha = 0.5)

-----------------------------------------------------------
#24/10/2020
  
library(dplyr)
install.packages("maps")
library(maps)

mi_countries <- map_data("world", "India")

df <- maps::world.cities
mi_cities <- maps::world.cities %>%
  as_tibble() %>%
  filter(country.etc == "India") %>%
  arrange(desc(pop))

ggplot(mi_cities, aes(long, lat)) +
  geom_point(aes(size = pop)) +
  scale_size_area() +
  coord_quickmap()

ggplot(mi_cities, aes(long, lat)) +
  geom_polygon(aes(group = group), mi_countries, fill = NA, colour ="grey50") + geom_point(aes(size = pop), colour = "red") +
  scale_size_area() +
  coord_quickmap()

ggplot(diamonds, aes(color, price)) +
  geom_bar(stat = "summary_bin", fun = mean)

p <- ggplot(mpg, aes(displ, hwy))
p
p + geom_point()

p + layer(mapping = NULL,
          data = NULL,
          geom = "point", params = list(),
          stat = "identity",
          position = "identity"
          )
library(ggplot2)

df <- data.frame(x = rnorm(2000), y = rnorm(2000))
norm <- ggplot(df, aes(x, y)) + xlab(NULL) + ylab(NULL)
norm + geom_point()
norm + geom_point(shape = 14)
norm + geom_point(shape = ".")


ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point()

ggplot(mpg,aes(displ, hwy)) +
  geom_point(aes(colour = class))

ggplot(mpg) +
  geom_point(aes(displ, hwy, colour = class))

ggplot() +
  geom_point(data=mpg, aes(displ, hwy, colour = class))

ggplot(mpg, aes(displ,hwy, colour = class)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  theme(legend.position = "none")

ggplot(mpg, aes(displ,hwy)) +
  geom_point(aes(colour=class)) +
  geom_smooth(method = "lm", se = FALSE) +
  theme(legend.position = "right")

ggplot(mpg, aes(displ,hwy)) +
  geom_point(aes(colour=class)) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x="Displacement", y ="Highway MPG", color = "Vehical Class)")

ggplot(mpg, aes(displ,hwy)) +
  geom_point(aes(colour=class)) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x="Displacement", y ="Highway MPG", color = "Vehical Class)") +
  scale_x_continuous(breaks = c(4,6))

ggplot(mpg, aes(displ,hwy)) +
  geom_point(aes(colour=class)) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x="Displacement", y ="Highway MPG", color = "Vehical Class)") +
  scale_x_continuous(breaks = c(4,6), labels = c("disp 4", "Disp 6"))

----------------------------------------------------------------------

# to convert given number to mentioned format
scales::label_dollar()(4)
scales::label_percent()(0.5)

ggplot(mpg, aes(displ,hwy)) +
  geom_point(aes(colour=class)) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(x="Displacement", y ="Highway MPG", color = "Vehical Class)") +
  scale_x_continuous(breaks = c(4,6), labels = c("disp 4", "Disp 6")) +
  scale_y_continuous(labels = scales::label_dollar())

?scales::dollar_format

# to change the color size (sequence should be same)
ggplot(mpg, aes(displ, hwy)) +
  geom_point(size = 4, colour = "grey20") +
  geom_point(aes(colour = class), size = 5)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(size = 4, colour = "grey20") +
  geom_point(aes(size = 5), colour = "grey20")

ggplot(mpg, aes(displ, hwy)) +
  geom_point(size = 4, colour = "grey20") +
  geom_point(aes(size = 5), colour = "grey20", show.legend = T)

-----------------------------------------------------------

norm <- data.frame(x = rnorm(1000), y = rnorm(1000))
norm

#create column z and gave a b c value
norm$z <- cut(norm$x, 3, labels = c("a", "b", "c"))
norm

ggplot(norm, aes(x, y)) +
  geom_point(aes(colour = z), alpha = 0.1)

# to change the transparency
ggplot(norm, aes(x, y)) +
  geom_point(aes(colour = z), alpha = 0.1) +
  guides(colour = guide_legend(override.aes = list(alpha = 1)))

p <- ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class), size = 5) +
  geom_point(size = 2, colour = "grey20", show.legend = T)
p

#to change the position of legend(value description box)
p + theme(legend.position = c(1,0), legend.justification = c(1,0))

p + theme(legend.position = c(1,1), legend.justification = c(0,0))


-------------------------------------------------------------------
# PIECHART

theme_set(theme_classic())

df <-  as.data.frame(table(mpg$class))
colnames(df) <-  c("class", "freq")
df

#first create barchart
pie <- ggplot(df, aes(x = "", y=freq, fill = factor(class))) +
  geom_bar(width = 1, stat = "identity") + theme(axis.line =
  element_blank(), plot.title = element_text(hjust = 0.5)) +
    labs(fill="class", x=NULL, y=NULL, title="Pie Chart Of Class", caption="Source: MPG")
pie

#then this
pie + coord_polar(theta="y", start=-90)

---------------------------------------------------

mtcars$`car name` <- rownames(mtcars)
mtcars$mpg_z <- round((mtcars$mpg - mean(mtcars$mpg)) / sd(mtcars$mpg),2)
#in above code created new column

mtcars$mpg_type <- ifelse(mtcars$mpg_z < 0, "below", "above")
mtcars <- mtcars[order(mtcars$mpg_z), ]

mtcars$`car name` <- factor(mtcars$`car name`, levels = mtcars$`car name`)

ggplot(mtcars, aes(x=`car name`, y=mpg_z, label=mpg_z)) +
  geom_bar(stat="identity", aes(fill=mpg_type), width=0.5) +
  scale_fill_manual(name = "Mileage", labels = c("Above Average", "Below
Average"), values = c("above"="#00ba38", "below"="#f8766d")) +
  labs(subtitle = "Normalised mileage from 'mtcars'", title = 
         "Diverging Bars") + coord_flip()


?scale_fill_brewer

g <- ggplot(mpg, aes(displ)) +
  scale_fill_brewer(palette = "Spectral")

g + geom_histogram(aes(fill=class), binwidth = 0.2, col="black",
                   sizw = 0.1) +
  labs(title="Histogram with Auto Binning", subtitle= "Engine
       Displacement across vehical classes")

#we can add mention bin numbers too
g + geom_histogram(aes(fill=class), bins=10, col="black",
                   sizw = 0.1) +
  labs(title="Histogram with Auto Binning", subtitle= "Engine
       Displacement across vehical classes")

g <- ggplot(mpg, aes(manufacturer))
g + geom_bar(aes(fill=class), width = 0.5) +
  theme(axis.text.x = element_text(angle =90,vjust=60)) +
  labs(title="Histogram on Categorical Variable",
       subtitle = "Manufacturer across Behical Classes")

----------------------------------------------------------------
  
plot(iris)
plot(iris$Petal.Length, iris$Sepal.Width)

ggplot(iris, aes(x=Petal.Length, y=Sepal.Width)) +
  geom_point()

#adding column
ggplot(iris, aes(x=Petal.Length, y=Sepal.Width, col = Species)) +
  geom_point()

#setting up size
ggplot(iris, aes(x=Petal.Length, y=Sepal.Width,
      col = Species, size = Petal.Width)) +
  geom_point()

#adding shape
ggplot(iris, aes(x=Petal.Length, y=Sepal.Width,
  col = Species, size = Petal.Width, shape = Species)) +
  geom_point()

#adding alpha (darker in shade)
ggplot(iris, aes(x=Petal.Length, y=Sepal.Width,
  col = Species, size = Petal.Width, shape = Species,
  alpha = Sepal.Length)) + geom_point()

#creating geombar using mean
ggplot(iris, aes(Species, Sepal.Length, fill = Species)) +
  geom_bar(stat = "summary", fun = "mean")

# to check the outliers
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "summary", fun = "mean", fill = "#ff0080",
    col = "black") + geom_point()

#
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "summary", fun = "mean", fill = "#ff0080",
           col = "black") + geom_point(position = position_jitter(0.2),
           size = 3, shape = 21)

-----
  
myplot <- ggplot(iris, aes(Species, Sepal.Length)) +
  geom_bar(stat = "summary", fun = "mean", fill = "#ff0080",
  col = "black") + geom_point(position = position_jitter(0.2),
  size = 3, shape = 21)
myplot

myplot <- theme(position = element_blank(),
          panel.background = element_rect(fill = "white"),
          panel.border = element_rect(colour = "black", fill = NA,
          size = 0.2))

myplot
myplot + theme_bw()
myplot + theme_classic()
myplot + theme_linedraw() + theme(panel.background = 
                                    element_rect(fill = "blue"))

------------------------------------------------------
  
ggplot(iris, aes(Species, Sepal.Length)) +
  geom_point() +
  geom_boxplot(fill = "#ff0080", col = "black", notch = TRUE)

myplot + theme_bw() +
  labs(x = "", y = "Sepal length (mm)") +
  ggtitle("Sepal length by iris species") +
  theme(plot.title = element_text(hjust = 0.5))

