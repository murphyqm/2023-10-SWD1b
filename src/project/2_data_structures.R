# Run a system command to create a directory called 'data'
system("mkdir data")
# Create a new data frame
cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))
write.csv(x = cats, file = "data/feline-data.csv", row.names = FALSE)

cats$weight <- cats$weight - 1

cats$weight + cats$likes_string
cats$weight + cats$coat

typeof(cats$weight)



