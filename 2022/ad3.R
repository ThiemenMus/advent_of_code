advent <- readLines('ad3.txt')

prio  <- c("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

score <- 0
for (line in advent) {
  line <- unlist(strsplit(line, ""))
  first_half <- line[1:(length(line)/2)]
  second_half <- line[(length(line)/2+1):length(line)]
  match <- intersect(first_half, second_half)
  score <- score + unlist(gregexpr(match, prio))
  
}
score

############################################################"

score <- 0
i <- 1
while (i < length(advent)) {
  ruck1 <- unlist(strsplit(advent[i], ""))
  ruck2 <- unlist(strsplit(advent[i+1], ""))
  ruck3 <- unlist(strsplit(advent[i+2], ""))
  match <- Reduce(intersect, list(ruck1, ruck2, ruck3))
  score <- score + unlist(gregexpr(match, prio))
  i <- i+3
}
score