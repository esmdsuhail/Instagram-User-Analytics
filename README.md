# Instagram-User-Analytics

## Table of content
- [Project Description](#Project-description)
- [Dataset](#Data-source)
- [Tools](#Tools)
- [Data Analysis](#Data-Analysis)
- [Conclusion](#conclusion)
  
### Project description
This project is on Instagram users in which we find their activities and usage. This helps improve and develop the user
experience by adding new features according to the given DATA. As a data analyst of the organization, I need to find
the user interactions and engagement with the Instagram app.

### Data source 
The project dataset is provided in SQL query format with data loaded in as 'Ig_clone' which was later analyzed by performing
required queries and functions using SQL fundamentals

### Tools
- MySQL Workbench for data analysis [Click Here](https://drive.google.com/file/d/1lbCwbUGyg677GAwkTEJR63V_52XKpMJ6/view?usp=sharing)
- MS Excel for Charts [Click Here](https://docs.google.com/spreadsheets/d/1VyRHNyrMYdw2DA8LdAjOm6Jto7bzSR5z/edit?usp=sharing&ouid=105843925605549140071&rtpof=true&sd=true)
- MS PowerPoint for data report  [Click Here](https://docs.google.com/presentation/d/1ErlqwCBOmaffRq4RogFxR8YoEB0SP5Fw/edit?usp=sharing&ouid=105843925605549140071&rtpof=true&sd=true)

### Data Analysis
To do data analysis, we need to perform some tasks from market analysis and investor analysis like,
#### Marketing Analysis & Investor Metrics:
1. Identify the five oldest users, Identify users (potential bots) who have liked every single photo on the site,
   and Identify users who have never posted a single photo on Instagram from the provided database.

 ![Users_ details](https://github.com/esmdsuhail/Instagram-User-Analytics/assets/142283402/0e7eeb74-4a8f-44a8-b4d1-86c5eff493d4)

- oldest users
 ```SQL  
SELECT * from users
ORDER BY created_at asc limit 5;
```
- Inactive Users  
```SQL
SELECT
 username as Inactive_users ,
DATE(created_at) AS from
FROM users
 LEFT JOIN
 photos ON users.id = photos.user_id
WHERE image_url IS NULL;
```
- Potential Bots
```SQL
SELECT user_id, username, count(photo_id) as no_hearts
FROM likes
INNER JOIN users on likes.user_id = users.i GROUP BY user_id
 HAVING no_hearts = 257;
```
Rewarding the 5 oldest users, Improving UI/UX for inactive users to engage more, and blocking the bots.


2. Determine the winner of the contest and provide their details to the team.

![Contest winner](https://github.com/esmdsuhail/Instagram-User-Analytics/assets/142283402/41414038-63ff-4740-b115-86f2a1523374)

- query on the nested query in the picture
```SQL
SELECT user_id, username, photo_id,
image_url, no_likes FROM total_like
 INNER JOIN photos on total_like.photo_id =
photos.id
 INNER JOIN users on photos.user_id =
users.id
 ORDER BY no_likes desc limit 10;
```



3. Identify and suggest the top five most commonly
used hashtags on the platform.

![Top Hashtag](https://github.com/esmdsuhail/Instagram-User-Analytics/assets/142283402/9d0fbef4-7da1-4632-991a-2c96709a019c)

- Top five hashtags
```SQL
SELECT
tag_name, COUNT(tag_id) AS no_tags
FROM
photo_tags
LEFT JOIN
tags ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY no_tags DESC
limit 5;
```


4. Calculate the average number of posts per user on Instagram. Also, provide the total number of photos on
Instagram is divided by the total number of users.

![Avg  poats](https://github.com/esmdsuhail/Instagram-User-Analytics/assets/142283402/394edad2-46fe-4cf9-9caa-52e97205bb69)

- Average posts per user
```SQL
SELECT
 user_id,
 username,
 COUNT(DISTINCT image_url) /
COUNT(DISTINCT user_id)
 AS avg_posts
FROM
 photos
 INNER JOIN
 users ON photos.user_id = users.id
GROUP BY user_id;
```
- Average posts by all users is "3.47"
```SQL
SELECT
 COUNT(DISTINCT image_url) /
COUNT(DISTINCT user_id) AS avg_posts
FROM
 Photos;
```


5. Determine the day of the week when most users register on
Instagram. Provide insights on when to schedule an ad
campaign.

![Day for campaign](https://github.com/esmdsuhail/Instagram-User-Analytics/assets/142283402/cc132837-4158-4002-9444-b1f44987e7d1)

- Day for campaign
```SQL
SELECT dayname(created_at) as day, count(*) as total
FROM users
GROUP BY day
ORDER BY total desc;
```
From piechart, most users created their account on SUNDAY and THURSDAY which are ideal to launch ad campaign.

### Conclusion
This project showcases my ability to use SQL to derive actionable insights from user data. The analysis provides valuable
information for marketing strategies, user engagement, and investor metrics. The SQL queries demonstrate proficiency
in data extraction and analysis, contributing to the informed decision-making for Instagram's further development.
