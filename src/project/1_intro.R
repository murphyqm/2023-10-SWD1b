# This script is an example from SWD1b 16-10-2023
# Adapted from these notes: https://swcarpentry.github.io/


# This is a comment and is not interpreted
# by R.

# R can be used as a simple calculator
# To run a line of code in an R script,
# move your cursor to the line and either click the "Run" 
# icon or use the keyboard shortcut ctrl + enter

1+1

# The output of the above line will show in the
# interactive console below
# it will have a [1] beside it showing it is the first
# line of output from the code you've run

1+2

1+3

1+4

# You can also highlight a block of code and run it in one go


# Estimate what you think the results will be of these similar commands:
(3 * 4) + 3

3 * 4 + 3

3 * (4 + 3)

# The order of precedence of commands is:

# Parentheses: (, )
# Exponents: ^ or **
# Multiply: *
# Divide: /
# Add: +
# Subtract: -

# If you run a partial command, for example missing a bracket
# the console will not show output and return to the "." symbol
# and instead will hang with a "+" symbol, waiting for you
# to complete the command

# try highlighting this line without the final ")"
3 * (4 + 3)

# You can either complete it by typing ) into the console
# or cancel by hitting Esc

# You can also use mathematical functions

sin(1) # sine trigonometry function

log(10) # natural log (ln)

log10(10) # log base 10

exp(0.25) # e^(1/4)


# Logic and comparisons

# To check for equality we use "==" (is equal to)
# SHould only be used for integers!

1 == 1 # Returns TRUE

1 == 2 # Returns FALSE

# To check for inequality we use "!=" (is not equal to)

1 != 2 # TRUE

2 != 2 # FALSE

# We can also use less than, greater than, less than or equal to and 
# greater than or equal to symbols

2 >= 2

2 > 2

2 >= 3

1 < 2

1 <= 1

1 < 1

1 >= -3

# Beware machine numeric tolerance when comparing numbers, and don't use
#  "==" to compare floating point numbers

# instead use the function all.equal()

all.equal(1.0, 1.0)

all.equal(1.0, 1.000001)

all.equal(2.0, 1.0)

# Variable assignment

# Values can be stored in variables using the "<-" assignment operator

x <- 2.5
y <- 1

# This variable will appear in the environment tab to the right
# Variables can be cleared from the environment using the brush symbol
# within the environment tab

# or they can deleted using the rm() function
rm(y)

# We can then use this variable alongside mathematical functions:

log(x)

# Variables can be reassigned:

x <- 100

# Try to estimate the results before running these lines:

x <- x + 1

y <- x * 2

# We can also get R to produce vectors

1:5 # This will be printed out in the console

z <- 1:5 # This will be stored in the variable

# mathematical functions can be applied to vectors

2^z

# Exercise - what is the value of mass and age at the end?

mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20
mass
age

# What happens if you re-run the lines "mass <- mass * 2.3" or
# "age <- age - 20"

# You can get the entire script to run using
# the keyboard shortcut ctrl + shift + enter
