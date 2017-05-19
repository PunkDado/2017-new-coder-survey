## Creates a correspondence matrix of the variables from 2016 and 2017

data2016 <- read.csv("/Users/Leonardo/OneDrive/Projetos/Data Science/FCC_NewCoderSurvey/2016-new-coder-survey/clean-data/NCS_2016.csv", header = T)
data2017 <- read.csv("/Users/Leonardo/OneDrive/Projetos/Data Science/FCC_NewCoderSurvey/2017-new-coder-survey/clean-data/NCS_2017.csv", header = T)

## 
fields2016 <- colnames(data2016)
fields2017 <- colnames(data2017)
metadata <- cbind(fields2016, fields2017)

clean_metadata <- metadata
for (i in 1:113) {
        clean_metadata[i,] <- metadata[i,]
}

for (i in 114:136) {
        clean_metadata[i,1] <- ""
        clean_metadata[i,2] <- metadata[i,2]
}

write.table(
        clean_metadata, 
        file = "/Users/Leonardo/OneDrive/Projetos/Data Science/FCC_NewCoderSurvey/2017-new-coder-survey/analysis/NCS_header.txt",
        sep = "\t\t\t\t"
)

## Filter - people taking FCC as resource
fcc <- data2017[data2017$ResourceFCC %in% T,]

## Filter - from fcc, people already working as software developer
fcc_soft_dev <- fcc[fcc$IsSoftwareDev %in% T,]

## Cria o arquivo .csv
write.csv(
        fcc_soft_dev, 
        file = "/Users/Leonardo/OneDrive/Projetos/Data Science/FCC_NewCoderSurvey/2017-new-coder-survey/analysis/NCS_fcc_soft_dev.csv"
)