-- 
-- From http://michaelran.azurewebsites.net/sql-learning-notes/
--

Test 1

Now using the raw data, write these queries:

-- select beer with empty or NULL manf

-- find the beer liked by >=1 person who frequents 'familiar'

-- find pairs of beer from same manf

-- first, find out the price of 'guinness' sold at 'beehive' -- then, find all beers at any bar sold at the same price

-- find the name and manf of each beer that 'zhang' likes -- try to use the 'in' keyword

-- find the beer sold for the highest price -- try to use the 'all' keyword

-- find beers that are the only beer by their manufacturer -- try to use the 'exists' keyword

-- find the drinkers and beers pairs that: -- 1. drinker likes the beer -- 1. drinker frequents at least 1 bar that sells the beer

-- find all prices charged for 'corona'

-- count number of bars that sells 'corona'

-- count number of bars that sells 'corona' at known price

-- count number of different prices charged for 'corona' at bars

-- calculate average price of each beer

-- find for each drinker, the average price of 'corona' -- at the bars that they frequent
Test 2

-- find average price of those beer that are either served -- in >= 3 bars, or are manufactured by 'Netherland'

-- delete all bears for which there's another beer by the same manufacturer

Hint:

DELETE B FROM beers B WHERE

-- first, add foreign key to table Sells, which references to the beer name -- second, delete any beer except 'corona', and see what happens to Sells

-- recreate the Sells table, so that price is always < $30(user CHECK keyword)

-- recreate the Sells table, so that only 'familiar' can sell beer less than $10 (user CHECK keyword)

-- create a view of your choice and explain what it does. 
