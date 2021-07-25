USE [Doctor Who]

--Enemy
CREATE TABLE Enemy
(
	EnemyID int NOT NULL PRIMARY KEY,
	EnemyName varchar(64),
	Description text
)

CREATE TABLE Author
(
	AuthorID int NOT NULL PRIMARY KEY,
	AuthorName varchar(64),
)

CREATE TABLE Doctor
(
	DoctorID int NOT NULL PRIMARY KEY,
	DoctorNumber int,
	DoctorName varchar(64),
	Birthdate Date,
	FirstEpisodeDate date,
	LastEpisodeDate date,
)

CREATE TABLE Episode
(
	EpisodeID int NOT NULL PRIMARY KEY,
	SeriesNumber int,
	EpisodeNumber int,
	EpisodeType varchar(64),
	Title varchar(255),
	EpisodeDate DateTime,
	AuthorID int FOREIGN KEY REFERENCES Author(AuthorID),
	DoctorID int FOREIGN KEY REFERENCES Doctor(DoctorID),
	Notes text
)

CREATE TABLE EpisodeEnemy
(
	EpisodeEnemyID int NOT NULL PRIMARY KEY,
	EpisodeID int FOREIGN KEY REFERENCES Episode(EpisodeID),
	EnemyID int FOREIGN KEY REFERENCES Enemy(EnemyID)
)

CREATE TABLE Companion
(
	CompanionID int NOT NULL PRIMARY KEY,
	CompanionName varchar(64),
	WhoPlayed int
)

CREATE TABLE EpisodeCompanion
(
	EpisodeCompanionID int NOT NULL PRIMARY KEY,
	EpisodeID int FOREIGN KEY REFERENCES Episode(EpisodeID),
	CompanionID int FOREIGN KEY REFERENCES Companion(CompanionID)
)