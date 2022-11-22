library(data.table)
library(tidyverse)
advent <- as_tibble(fread('input2.txt'))
direction <- advent$V1
change <- advent$V2

aim <- 0
horizontal <- 0
depth <- 0
for (i in 1:length(direction)) {
  if (direction[i] == 'forward') {
    horizontal <- horizontal + change[i]
    depth <- depth + (aim*change[i])
  }
  if (direction[i] == 'down') {
    aim <- aim + change[i]
  }
  if (direction[i] == 'up') {
    aim <- aim - change[i]
  }
}
print(horizontal*depth)
