# This is some hacking from the book 
# https://www.modernstatisticswithr.com/
# Chapters 2.4 ff

# We can use semi-colons to put multiple statements on one line.
income = 100 ; taxes = 30
net_income <- income - taxes
print(net_income)

# C Stands for combine
age <- c(28, 48, 47, 71, 22, 80, 48, 30, 31)

# Operations are easily vectorized.
age_in_months <- age * 12

age
age_in_months

# If we have N vectors, we can turn them into a dataFrame
purchase <- c(20, 59, 2, 12, 22, 160, 34, 34, 29)

bookstore <- data.frame(age, purchase)

# This shows our data frame, but better to click on it in 
# enviornment window. :)
bookstore


# For longer variables, # displayed is in [] at beginning of row
# is first index in that row.  Remember, one based!
distances <- c(687, 5076, 7270, 967, 6364, 1683, 9394, 5712, 5206,
               4317, 9411, 5625, 9725, 4977, 2730, 5648, 3818, 8241,
               5547, 1637, 4428, 8584, 2962, 5729, 5325, 4370, 5989,
               9030, 5532, 9623)
distances

# Exercise 2.4 Do the following:
# Create two vectors, height and weight, containing the heights and weights of five fictional people (i.e., just make up some numbers!).
# Combine your two vectors into a data frame.
# You will use these vectors in Exercise 2.6.

# height in inches
height = c(73, 65, 69, 60, 74)

# In lbs
weight = c(219, 140, 140, 110, 220)

person_stats = data.frame(height, weight, row_names = c("John", "Jenniffer", "Millie", "Shorty", "Stretch"))

person_stats

one_to_five <- 1:5
one_to_five
backwards <- 5:1
backwards

count_up_down = c(1:5, 4:1)
count_up_down

mean(height)

cor(height, weight)

sort(weight)

1/0

sqrt(complex(1, -1, 0))

library(palmerpenguins)
# ?penguins
# str(penguins)
penguins

summary(penguins)

library(ggplot2)
# ggplot(msleep, aes(sleep_total, awake)) + geom_point()

ggplot(penguins, aes(bill_length_mm, flipper_length_mm, colour = species)) +
      geom_point() +
      labs(x = "Bill length (mm)",
           y = "Flipper length (mm)")