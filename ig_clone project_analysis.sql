use ig_clone;

# -----Marketing Analysis------

# Identify the five oldest users on Instagram from the provided database.
select * from users
 where created_at > 2016
 order by created_at asc limit 5;
 
 select * from users
 order by created_at asc limit 5;
 
# Identify users who have never posted a single photo on Instagram.
with inact_user as (
SELECT 
      username as Inactive_users , DATE(created_at) AS `from`
from 
    users
        LEFT JOIN
    photos ON users.id = photos.user_id
WHERE
    image_url IS NULL )
    select * from inact_user;
    select count(*) as total_inactive_users from inact_user;


# Determine the winner of the contest and provide their details to the team.
with total_like as(select photo_id, count(user_id) as no_likes
 from likes
group by photo_id
order by no_likes desc)
select  user_id, username, photo_id, image_url, no_likes from total_like 
  inner join photos on total_like.photo_id = photos.id
  inner join users on photos.user_id = users.id
  order by no_likes desc limit 10;

# Identify and suggest the top five most commonly used hashtags on the platform.
SELECT 
    tag_name, COUNT(tag_id) AS no_tags
FROM
    photo_tags
        LEFT JOIN
    tags ON photo_tags.tag_id = tags.id
GROUP BY tag_name
ORDER BY no_tags DESC
limit 5;

#  Determine the day of the week when most users register on Instagram. Provide insights on when to schedule an ad campaign.
select dayname(created_at) as `day`, 
		count(*) as total
from users
group by `day` 
order by total desc;

#-----Investor Metrics------
# Calculate the average number of posts per user on Instagram. Also,--
# --provide the total number of photos on Instagram divided by the total number of users.
SELECT 
    user_id,
    username,
    COUNT(DISTINCT image_url) / COUNT(DISTINCT user_id) AS avg_posts
FROM
    photos
        INNER JOIN
    users ON photos.user_id = users.id
GROUP BY user_id;

SELECT 
    COUNT(DISTINCT image_url) / COUNT(DISTINCT user_id) AS avg_posts
FROM
    photos;

#  Identify users (potential bots) who have liked every single photo on the site, as this is not typically possible for a normal user
SELECT 
    user_id, username, COUNT(photo_id) AS no_hearts
FROM
    likes
        INNER JOIN
    users ON likes.user_id = users.id
GROUP BY user_id
HAVING no_hearts = 257;
    
    with Bots as(select user_id, username, count(photo_id) as no_hearts from likes
	inner join users on likes.user_id = users.id
    group by user_id 
    having no_hearts = 257)
    
    select count(*) from Bots;