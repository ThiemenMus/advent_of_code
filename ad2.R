advent <- readLines('ad2.txt')

outcome <- function(first_hand, second_hand) {
  score <- 0
  hands <- c("X", "Y", "Z")
  elf_hands <- c("A", "B", "C")
  
  if (which(elf_hands == first_hand) 
      == which(hands == second_hand)) {
    score <- 3 + which(hands == second_hand)
  } else {
    if (second_hand == "X" & first_hand == "C") {
      score <- 6 + 1
    } else if (second_hand == "Y" & first_hand == "A") {
      score <- 6 + 2
    } else if (second_hand == "Z" & first_hand == "B") {
      score <- 6 + 3
    } else {
      score <- which(hands == second_hand)
    }
  }
  return(score)      
}
  
score <- 0
for (i in 1:length(advent)) {
  elf_hand <- substr(advent[i], 1, 1)
  human_hand <- substr(advent[i], 3, 3)
  score <- score + outcome(elf_hand, human_hand)
}

######################################################

outcome2 <- function(elf_hand, wanted_outcome) {
  elf_hands <- c("A", "B", "C")
  
  if (wanted_outcome == "Y") {
    score <- 3 + which(elf_hands == elf_hand)
  } else if (wanted_outcome == "Z") {
    human_hand <- which(elf_hands == elf_hand) + 1
    if (human_hand == 4) {
      human_hand <- 1
    }
    score <- 6 + human_hand
  } else if (wanted_outcome == "X") {
    human_hand <- which(elf_hands == elf_hand) - 1
    if (human_hand == 0) {
      human_hand <- 3
    }
    score <- human_hand
  }
  return(score)      
}

score <- 0
for (i in 1:length(advent)) {
  elf_hand <- substr(advent[i], 1, 1)
  wanted_outcome <- substr(advent[i], 3, 3)
  score <- score + outcome2(elf_hand, wanted_outcome)
}

score <- 0
for (i in 1:length(test)) {
  elf_hand <- substr(test[i], 1, 1)
  print(elf_hand)
  wanted_outcome <- substr(test[i], 3, 3)
  print(wanted_outcome)
  score <- score + outcome2(elf_hand, wanted_outcome)
  print(score)
}