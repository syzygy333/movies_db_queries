-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

SELECT title, rating AS top_50_worst_movies
FROM movies
ORDER BY rating, title LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

SELECT title AS movies_without_ratings
FROM movies
WHERE rating IS NULL
ORDER BY title;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

SELECT title AS thrilling_movies
FROM movies
WHERE synopsis LIKE '%thrilling%'
ORDER BY title;

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

SELECT title, year, rating AS highest_rated_80s_scifiandfantasy_films
FROM movies
JOIN genres ON movies.genre_id = genres.id
WHERE year BETWEEN 1979 and 1990 AND genres.id = 17 AND rating IS NOT NULL
ORDER BY rating DESC;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

SELECT actors.name AS actor, title, year
FROM movies
JOIN cast_members ON movies.id = cast_members.movie_id
JOIN actors ON actors.id = cast_members.actor_id
WHERE cast_members.character = 'James Bond'
ORDER BY movies.year;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

SELECT title, year, genres.name AS genre
FROM movies
JOIN genres ON movies.genre_id = genres.id
JOIN cast_members ON movies.id = cast_members.movie_id
JOIN actors ON actors.id = cast_members.actor_id
WHERE actors.name = 'Julianne Moore'
ORDER BY genres.name, movies.title;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

SELECT title, year, studios.name AS studio
FROM movies
JOIN studios ON movies.studio_id = studios.id
JOIN genres ON movies.genre_id = genres.id
WHERE genres.name = 'Horror'
ORDER BY movies.year LIMIT 5;
