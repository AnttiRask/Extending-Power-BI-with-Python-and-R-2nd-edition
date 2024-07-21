library(stringr)

# Counting dots (.) ----

string <- "This is a sentence. This is also a sentence."

# Dot (.) is a special character. With this we'll be counting all the characters in the string.
str_count(string, ".")
# [1] 44

# Normally, we would escape the special character with a backslash. However, in R, using only one will lead into error.
str_count(string, "\.")
# Error: '\.' is an unrecognized escape in character string (<input>:1:21)

# We need to use double backslash instead. This script will count the number of actual dots in the string.
str_count(string, "\\.")
# [1] 2

# Another possibility is to use the r'(...)' syntax.
str_count(string, r'(\.)')
# [1] 2


# Counting backslashes (\) ----

string <- "C:\ThisIsADirectory\ThisIsASubDirectory\ThisIsAFile.txt"

# The above will cause this error: "Error: '\T' is an unrecognized escape in character string (<input>:1:15)"
# What we have to do instead is use double backslashes already in the original string:

string1 <- "C:\\ThisIsADirectory\\ThisIsASubDirectory\\ThisIsAFile.txt"

# Or, use the r'(...)' syntax:

string2 <- r'(C:\ThisIsADirectory\ThisIsASubDirectory\ThisIsAFile.txt)'

# The outputs are the same
string1
# [1] "C:\\ThisIsADirectory\\ThisIsASubDirectory\\ThisIsAFile.txt"

string2
# [1] "C:\\ThisIsADirectory\\ThisIsASubDirectory\\ThisIsAFile.txt"

# Looks a bit weird, but if we print it out, there is only on backslash present
cat(string1)
# C:\ThisIsADirectory\ThisIsASubDirectory\ThisIsAFile.txt

# Now, if we want to count the backslashes, there is even more trickery that we have to do.
# We can't even try str_count(string, "\")... go on, try it and see what happens!

# But using a double backslash before the double backslash will do the trick.
str_count(string1, "\\\\")
# [1] 3

# Again, another possibility is to use the r'(...)' syntax.
str_count(string1, r'(\\)')
# [1] 3