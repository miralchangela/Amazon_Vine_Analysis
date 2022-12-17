select * from vine_table;

-- total_votes is greather or equal 20 
DROP TABLE IF EXISTS total_votes_more_20;
select  * 
into total_votes_more_20
from vine_table where total_votes >= 20 ;

-- total_votes is greater or equal 50% 
DROP TABLE IF EXISTS total_votes_more_50;

select * 
into total_votes_more_50
from total_votes_more_20  
where (CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT)) *100 >= 50;

select * from total_votes_more_50;

-- paid vine program
DROP TABLE IF EXISTS paid_vine_program;

select * 
into paid_vine_program
from total_votes_more_50 where vine = 'Y';

-- unpaid vine program
DROP TABLE IF EXISTS unpaid_vine_program;

select * 
into unpaid_vine_program
from total_votes_more_50 where vine = 'N';

-- Determine the total number of reviews, the number of 5-star reviews,
-- and the percentage of 5-star reviews for paid vine program
DROP TABLE IF EXISTS paid_analysis_table;

SELECT vine,
count(review_id) AS total_number_of_reviews , 
count(
	case when star_rating=5 
		then review_id 
		else NULL 
		end) AS number_of_5_star_reviews,
cast(count(
	case when star_rating=5 
	then review_id else NULL end)*100/count(review_id) as FLOAT) AS percentage
into paid_analysis_table 
from total_votes_more_50 
group by vine;

select * from paid_analysis_table;

--

select 
 (CAST(number_of_5_star_reviews AS FLOAT)/CAST(total_number_of_reviews AS FLOAT)) * 100 AS percentage
FROM paid_analysis_table;
