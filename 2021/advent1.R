library(data.table)
advent <- fread('input.txt')
advent <- advent$V1
count <- 0
som1 <- sum(advent[1:3])
for (i in 4:length(advent)) {
  som2 <- advent[i-2] + advent[i-1] + advent[i]
  if (som2 > som1) {
    count <- count + 1
  }
  som1 <- som2
}
print(count)
