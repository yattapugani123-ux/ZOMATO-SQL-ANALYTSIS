SELECT * FROM ZOMATO;

--START PROGRAM--

--Level 1: Basic Data Retrieval--

--1) Online Presence: Write a query to list the names and ratings of all restaurants that offer online ordering.--

SELECT names,
        rating FROM ZOMATO
 WHERE online_orders = 1;

--2) Cost Analysis: Find all restaurants where the approx_cost(for two people) is less than or equal to 300.--

SELECT names,
        approx_cost_for_two_people FROM ZOMATO
WHERE approx_cost_for_two_people <= 300;

--3) Dining Types: List all unique restaurant types found in the listed_in(type) column.--

SELECT names AS  unique_restaurant FROM ZOMATO
WHERE listed_in_type = 'Dining';

--4) Popularity Check: Retrieve the names of restaurants that have received more than 500 votes.

SELECT names AS High_votes,votes FROM ZOMATO
 WHERE votes > 500;

--Level 2: Aggregation & Grouping--

--5) Type vs. Cost: Calculate the average cost for two people for each restaurant type (listed_in(type)). Sort the results from most expensive to cheapest.--

SELECT listed_in_type,AVG(approx_cost_for_two_people) AS AVG_COST from ZOMATO
GROUP BY listed_in_type
ORDER BY AVG_COST DESC;

--6) Booking Impact: Compare the total number of restaurants that offer table booking versus those that do not.--

SELECT COUNT(book_table)AS NO_BOOKING FROM ZOMATO
GROUP BY book_table
--7) Vote Leaders: Find the top 5 most popular restaurants based on the total number of votes.--

SELECT TOP 5 names,votes FROM ZOMATO
ORDER BY votes DESC


--8) Rating Frequency: Count how many restaurants fall under each specific rating (e.g., how many are '4.1/5', '3.8/5', etc.).--

SELECT rating, COUNT(*) RATEING_TOTAL FROM ZOMATO
GROUP BY rating
ORDER BY rating desc

--Level 3: Advanced Analysis & Logic--

--9)The "Best Value" Search: Find restaurants that have a rating higher than 4.0/5 but an approx_cost(for two people) that is below the overall average cost of the entire dataset.

SELECT names,
        rating,
        approx_cost_for_two_people AS COST from ZOMATO
WHERE rating > '4.0/5'
   AND approx_cost_for_two_people < 
                        (SELECT AVG(approx_cost_for_two_people) FROM ZOMATO );

--10) String Manipulation (Cleaning): Write a query to extract just the numeric part of the rate column (e.g., convert '4.1/5' to 4.1) so you can calculate the average rating for the entire city.--

SELECT AVG(CAST(REPLACE(rating,'/5',' ') as float))   
     AS AVERAGE_rating FROM ZOMATO
        WHERE rating != 'NEW' AND
            rating != '-';

--11) High Engagement vs. Low Rating: Identify restaurants that have more than 1,00 votes but a rating below 3.5/5.--
SELECT names,
        rating,
        votes
            from ZOMATO
WHERE votes > 100
AND rating < '3.5/5';

--12)The "Premier" Segment: List restaurants that offer both online ordering and table booking, and have a rating of at least 4.0.--

SELECT NAMES,
online_orders,
book_table,rating FROM ZOMATO
    WHERE online_orders = 1 AND book_table = 1 AND rating >='4.0';











