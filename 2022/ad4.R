advent <- readLines('ad4.txt')

count <- 0
for (i in advent) {
  sections <- unlist(strsplit(i, ','))
  section1 <- as.integer(unlist(strsplit(sections[1], '-')))
  section2 <- as.integer(unlist(strsplit(sections[2], '-')))
  if (section1[1] >= section2[1] & section1[2] <= section2[2]) {
    count <- count + 1
  } else if (section2[1] >= section1[1] & section2[2] <= section1[2]) {
    count <- count + 1
  }
}

print(count)

##################################################

count <- 0
for (i in advent) {
  sections <- unlist(strsplit(i, ','))
  section1 <- as.integer(unlist(strsplit(sections[1], '-')))
  section2 <- as.integer(unlist(strsplit(sections[2], '-')))
  if (length(intersect(section1[1]:section1[2], section2[1]:section2[2])) > 0) {
    count <- count + 1
  }
}
print(count)