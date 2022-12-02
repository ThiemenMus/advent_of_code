library(data.table)
advent <- readLines('ad1.txt')

# 1
curr <- 0; max <- 0
for (i in advent) {
  if (curr > max) {
    max <- curr
  }
  if (i=="") {
    curr <- 0
  } else {
    curr <- curr + as.integer(i)
  }
}
if(curr > max) {
  max <- curr
}

# 2
curr <- 0; max <- c(0, 0, 0)
for (i in 1:length(advent)) {
  print(max); print(i); print(curr)
  if (advent[i]=="" | i == length(advent)) {
    index <- sum(curr > max)
    if (index == 1) {
      max[1] <- curr
    } else if (index == 2) {
      max[1] <- max[2]
      max[2] <- curr
    } else if (index == 3) {
      max[1] <- max[2]
      max[2] <- max[3]
      max[3] <- curr
    }
    curr <- 0
  } else {
    curr <- curr + as.integer(advent[i])
  }
}
sum(max)
