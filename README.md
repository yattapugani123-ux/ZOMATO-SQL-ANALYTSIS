# Zomato Restaurant Data Analysis - SQL Project

## Project Overview
As a Computer Science student, I developed this project to demonstrate my ability to perform end-to-end data analysis using SQL. Using a dataset of restaurant information from Zomato, I performed data cleaning, exploratory analysis, and advanced querying to uncover insights into consumer behavior, pricing strategies, and service impact.



## Dataset Description
The dataset contains information on 148 restaurants with the following columns:
- **names**: Name of the restaurant.
- **online_orders**: Whether the restaurant accepts orders online (Yes/No).
- **book_table**: Whether table booking is available (Yes/No).
- **rating**: Customer rating (out of 5).
- **votes**: Total number of ratings/reviews received.
- **approx_cost(for two people)**: Estimated cost for a meal for two.
- **listed_in(type)**: Category of the restaurant (Buffet, Cafes, Dining, etc.).

##  Analysis Roadmap
The project is divided into three levels of analytical complexity:

### Level 1: Basic Data Retrieval
- Identified restaurants with an online presence to analyze digital adoption.
- Performed cost analysis to find budget-friendly options ($\le$ 300).
- Filtered high-engagement restaurants based on total votes.

### Level 2: Aggregation & Grouping
- **Market Trends**: Calculated average costs per dining type to identify the most premium categories.
- **Service Impact**: Compared the volume of restaurants offering table bookings vs. those that do not.
- **Performance Leaders**: Identified the Top 5 most popular restaurants based on customer feedback.

### Level 3: Advanced Logic & Data Cleaning
- **Data Transformation**: Used string manipulation (`REPLACE` and `CAST`) to clean the rating column for mathematical analysis.
- **Value Discovery**: Developed subqueries to identify "High Value" spots—those with above-average ratings but below-average costs.
- **Business Insights**: Isolated "Controversial" restaurants (High votes but low ratings) to highlight areas for service improvement.



##  Tools Used
- **SQL**: Primary tool for data manipulation and analysis.
- **CSV/Excel**: Source data management.
- **GitHub**: Version control and project documentation.

##  Key Takeaways
1. **Limited Premium Services**: Only a small fraction of restaurants (approx. 5%) offer table bookings, suggesting a gap in the market for premium dining experiences.
2. **Pricing Sweet Spot**: The average cost for two people across the city is approximately 418, providing a benchmark for new restaurant owners.
3. **Dining Dominance**: The "Dining" category is the most frequent restaurant type, but "Buffet" and "Cafes" tend to have higher engagement in terms of votes.

##  Repository Structure
- `Zomato-data-.csv`: The raw dataset used for analysis.
- `queries.sql`: The full SQL script containing all 12 analytical queries.
- `README.md`: Project documentation.

---
**Developed by:** Ganesh kumar Reddy
**Email:** yattapugani123@gmail.com
**University:** Kalasalingam Academy of Research and Education


**START PROGRAM**

**Level 1: Basic Data Retrieval**

` SELECT * FROM ZOMATO;`

**1) Online Presence: Write a query to list the names and ratings of all restaurants that offer online ordering.**
```SQL
SELECT names,
        rating FROM ZOMATO
 WHERE online_orders = 1;
```
**2) Cost Analysis: Find all restaurants where the approx_cost(for two people) is less than or equal to 300.**
``` SQL
SELECT names,
        approx_cost_for_two_people FROM ZOMATO
WHERE approx_cost_for_two_people <= 300;
```
**3) Dining Types: List all unique restaurant types found in the listed_in(type) column.**
```SQL
SELECT names AS  unique_restaurant FROM ZOMATO
WHERE listed_in_type = 'Dining';
```
**4) Popularity Check: Retrieve the names of restaurants that have received more than 500 votes.**
```SQL
SELECT names AS High_votes,votes FROM ZOMATO
 WHERE votes > 500;
```
**Level 2: Aggregation & Grouping**

**5) Type vs. Cost: Calculate the average cost for two people for each restaurant type (listed_in(type)). Sort the results from most expensive to cheapest.**
```SQL
SELECT listed_in_type,AVG(approx_cost_for_two_people) AS AVG_COST from ZOMATO
GROUP BY listed_in_type
ORDER BY AVG_COST DESC;
```
**6) Booking Impact: Compare the total number of restaurants that offer table booking versus those that do not.**
```SQL
SELECT COUNT(book_table)AS NO_BOOKING FROM ZOMATO
GROUP BY book_table
```
**7) Vote Leaders: Find the top 5 most popular restaurants based on the total number of votes.**
```SQL
SELECT TOP 5 names,votes FROM ZOMATO
ORDER BY votes DESC

```
**8) Rating Frequency: Count how many restaurants fall under each specific rating (e.g., how many are '4.1/5', '3.8/5', etc.).**
```SQL
SELECT rating, COUNT(*) RATEING_TOTAL FROM ZOMATO
GROUP BY rating
ORDER BY rating desc
```
**Level 3: Advanced Analysis & Logic**

**9)The "Best Value" Search: Find restaurants that have a rating higher than 4.0/5 but an approx_cost(for two people) that is below the overall average cost of the entire dataset.**
```SQL
SELECT names,
        rating,
        approx_cost_for_two_people AS COST from ZOMATO
WHERE rating > '4.0/5'
   AND approx_cost_for_two_people < 
                        (SELECT AVG(approx_cost_for_two_people) FROM ZOMATO );
```
**10) String Manipulation (Cleaning): Write a query to extract just the numeric part of the rate column (e.g., convert '4.1/5' to 4.1) so you can calculate the average rating for the entire city.**
```SQL
SELECT AVG(CAST(REPLACE(rating,'/5',' ') as float))   
     AS AVERAGE_rating FROM ZOMATO
        WHERE rating != 'NEW' AND
            rating != '-';
```
**11) High Engagement vs. Low Rating: Identify restaurants that have more than 1,00 votes but a rating below 3.5/5.**
```SQL
SELECT names,
        rating,
        votes
            from ZOMATO
WHERE votes > 100
AND rating < '3.5/5';
```
**12)The "Premier" Segment: List restaurants that offer both online ordering and table booking, and have a rating of at least 4.0.**
```SQL
SELECT NAMES,
online_orders,
book_table,rating FROM ZOMATO
    WHERE online_orders = 1 AND book_table = 1 AND rating >='4.0';
```
**THE END**

**Core Project Stats**
##Dataset Size: 148
##Restaurants.Average Rating: $3.63 / 5.0$.
##Average Cost for Two: $418$.
##Most Popular Restaurant: Empire Restaurant ($4,884$ votes).**




