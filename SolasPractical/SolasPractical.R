#A

warpbreaks
library(dplyr)

#1
select_if(warpbreaks, is.numeric)

#2
typeof(warpbreaks)
#no columns has a data type of an integer


#3
#as.integer(warpbreaks)
#Error: 'list' object cannot be coerced to type 'integer'


#B

#1
(txt <- readLines("C:/Users/student/Downloads/exampleFile.txt"))

#2
c <- grepl("//",txt)
s <- grepl(";",txt)

(com <- txt[!c])

(so <- txt[!s])



#3
may <- grepl("21 May 2013",txt)
may

#4

#a
data <- strsplit(com, split = ";")
data

#b
_
