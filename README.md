# Amazon Vine Analysis

## Hadoop vs spark
- Hadoop is an ecosystem for handling big data. Expect to spend significant time configuring multiple servers or computers, as well as researching which technology can best deliver your big data solution.
- Apache Spark (Spark) is a unified analytics engine for large-scale data processing. Spark lets you write applications in code that can run on Hadoop. 
- However, Spark doesn't have to run on Hadoop, as it can run in stand-alone mode or in the cloud. Spark can be 100 times faster than Hadoop.

## Overview of the project

- In this project, which will require you to analyze product reviews for a marketing company.Working with datasets of Big size creates unique challenges.
- The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. Companies like SellBy pay a small fee to Amazon and provide products to Amazon Vine members, who are then required to publish a review.
- we will have to access to approximately 50 datasets.Each one contains reviews of different category such as clothing to wireless product. I will need to pick one of these datasets and use Pyspark to perform the ETL process to extract the datasets.
- Transform the data, connect to an AWS RDS instance, and load the transformed data into pgAdmin.

## Perform ETL on Amazon Product Reviews

- Using your knowledge of the cloud ETL process, you’ll create an AWS RDS database with tables in pgAdmin.
- I picked a jewellary dataset from the Amazon Review datasets : [Amazon Review datasets](https://s3.amazonaws.com/amazon-reviews-pds/tsv/index.txt)
- DataFrame transform  into separate Dataframes that match the table schema in PgAdmin.
- Afterthat upload the transformed data into the appropriate tables and run queries in PgAdmin to confirm that data has been uploaded properly.

![Jewellary dataframe](https://github.com/miralchangela/Amazon_Vine_Analysis/blob/main/resources/images/maindataframe.png)

### The customers table DataFrame
- To create the customer table , use group by function on the id column and count the number of the customers.
- customer table is shown below:

![customer_table](https://github.com/miralchangela/Amazon_Vine_Analysis/blob/main/resources/images/customer%20table.png)

### The products table DataFrame
- To create the product table, select product id and product title from main dataframe.
-  Below image is shown as a product_table:

![product_table](https://github.com/miralchangela/Amazon_Vine_Analysis/blob/main/resources/images/product%20table.png)

### The review id table DataFrame
- To create the review id table , use the select function in google colab which select review id, customer id, product id, product parent, and review date from main dataframe.
- review id table is shown below:

![review_id_table](https://github.com/miralchangela/Amazon_Vine_Analysis/blob/main/resources/images/review_id_table.png)

### The vine table dataframe
- to create the vine table , use select function to select only the columns that are in the vine table in pgadmin.
vine table is shown below:

![vine_table](https://github.com/miralchangela/Amazon_Vine_Analysis/blob/main/resources/images/vine_df.png)

## Results
- Using knowledge of Pyspark, Pandas or SQL, we'll determine if there is any bias towards reviews that were written as part of the vine program.

- Filter the data and create a new dataframe or table to retrieve all the rows where,
    1) The total votes count is equal to or greater than 20.
    2) Percent of Helpful Votes to Total Votes equal or greater than 50%.

### How many Vine reviews and non-Vine reviews were there?
- Vine members made up only 2.1% (1,080) of the reviews whereas the remaining 97.9% were Non-Vine members (49,659).

- Here, Precending images are shown for vine and non-vine reviews.

![paid_vine_program](https://github.com/miralchangela/Amazon_Vine_Analysis/blob/main/resources/images/paid_vine_program.png)

![unpaid_vine_program](https://github.com/miralchangela/Amazon_Vine_Analysis/blob/main/resources/images/unpaid_vine_program.png)

### How many Vine reviews were 5 stars? How many non-Vine reviews were 5 stars?

* Vine members gave 454 out of 1,080 reviews a 5 star rating.
* Non-Vine members gave 23,034 out of 49,659 reviews a 5 star rating.

![5_star_reviews](https://github.com/miralchangela/Amazon_Vine_Analysis/blob/main/resources/images/helpful_votes.png)

### What percentage of Vine reviews were 5 stars? What percentage of non-Vine reviews were 5 stars?

* 42% of the reviews for Vine members were rated 5 stars.
* 46.4% of the reviews for Non-Vine members were rated 5 stars.

![total_df](https://github.com/miralchangela/Amazon_Vine_Analysis/blob/main/resources/images/rating_total_df.png)

## Summary:


