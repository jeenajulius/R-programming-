
library(ggplot2)


data <- read.csv("C:\\Users\\hp\\Downloads\\oreos.csv")

head(data)
summary(data)

model <- lm(Sales ~ `Height.in.Feet`, data = data)
summary(model)

ggplot(data, aes(x = `Height.in.Feet`, y = Sales)) +
  geom_point() +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Simple Linear Regression", x = "Height in Feet", y = "Sales")

new_heights <- data.frame(Height.in.Feet = c(30, 50, 70))
predictions <- predict(model, new_heights)
predictions

ggplot(data, aes(x = Height.in.Feet, y = Sales)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Sales vs Shelf Height with Regression Line",
       x = "Shelf Height (in cm)",
       y = "Sales (units)")

