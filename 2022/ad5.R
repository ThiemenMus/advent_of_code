advent <- readLines('ad5.txt')

stacks <- list()
stacks[[1]] <- c("F", "C", "J", "P", "H", "T", "W")
stacks[[2]] <- c("G", "R", "V", "F", "Z", "J", "B", "H")
stacks[[3]] <- c("H", "P", "T", "R")
stacks[[4]] <- c("Z", "S", "N", "P", "H", "T")
stacks[[5]] <- c("N", "V", "F", "Z", "H", "J", "C", "D")
stacks[[6]] <- c("P", "M", "G", "F", "W", "D", "Z")
stacks[[7]] <- c("M", "V", "Z", "W", "S", "J", "D", "P")
stacks[[8]] <- c("N", "D", "S")
stacks[[9]] <- c("D", "Z", "S", "F", "M")

instr <- advent[11:length(advent)]
words <- c("move", "from", "to")

for (i in instr) {
  
  x <- unlist(strsplit(i, " "))
  x <- as.integer(x[!x %in% words])
  move <- x[1]; from <- x[2]; to <- x[3]
  
  moving_crates <- stacks[[from]][(length(stacks[[from]]) - move + 1):length(stacks[[from]])]
  moving_crates <- rev(moving_crates)
  
  stacks[[to]] <- c(stacks[[to]], moving_crates)
  stacks[[from]] <- stacks[[from]][0:(length(stacks[[from]]) - move)]
}

for (i in stacks) {
  print(i[length(i)])
}

#########################################################################

stacks <- list()
stacks[[1]] <- c("F", "C", "J", "P", "H", "T", "W")
stacks[[2]] <- c("G", "R", "V", "F", "Z", "J", "B", "H")
stacks[[3]] <- c("H", "P", "T", "R")
stacks[[4]] <- c("Z", "S", "N", "P", "H", "T")
stacks[[5]] <- c("N", "V", "F", "Z", "H", "J", "C", "D")
stacks[[6]] <- c("P", "M", "G", "F", "W", "D", "Z")
stacks[[7]] <- c("M", "V", "Z", "W", "S", "J", "D", "P")
stacks[[8]] <- c("N", "D", "S")
stacks[[9]] <- c("D", "Z", "S", "F", "M")

for (i in instr) {
  
  x <- unlist(strsplit(i, " "))
  x <- as.integer(x[!x %in% words])
  move <- x[1]; from <- x[2]; to <- x[3]
  
  stacks[[to]] <- c(stacks[[to]], stacks[[from]][(length(stacks[[from]]) - move + 1):length(stacks[[from]])])
  stacks[[from]] <- stacks[[from]][0:(length(stacks[[from]]) - move)]
}

for (i in stacks) {
  print(i[length(i)])
}