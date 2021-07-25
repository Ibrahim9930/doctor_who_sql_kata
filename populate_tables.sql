USE [Doctor Who]

BULK INSERT Enemy
FROM '/home/enemy.csv'
WITH(
	FIRSTROW = 2,
	FORMAT='CSV'
)

BULK INSERT Author
FROM '/home/author.csv'
WITH(
	FIRSTROW = 2,
	FORMAT='CSV'
)


BULK INSERT Doctor
FROM '/home/doctor.csv'
WITH(
	FIRSTROW = 2,
	FORMAT='CSV'
)

BULK INSERT Episode
FROM '/home/episode.csv'
WITH(
	FIRSTROW = 2,
	FORMAT='CSV'
)

BULK INSERT EpisodeEnemy
FROM '/home/episode_enemy.csv'
WITH(
	FIRSTROW = 2,
	FORMAT='CSV'
)

BULK INSERT Companion
FROM '/home/companion.csv'
WITH(
	FIRSTROW = 2,
	FORMAT='CSV'
)

BULK INSERT EpisodeCompanion
FROM '/home/episode_companion.csv'
WITH(
	FIRSTROW = 2,
	FORMAT='CSV'
)