CREATE OR ALTER VIEW viewEpisodes as
SELECT 
	e.EpisodeID, e.Title, e.SeriesNumber, e.EpisodeNumber, 
	e.EpisodeDate, e.Notes, e.EpisodeType, d.DoctorName, a.AuthorName,
	dbo.fnCompanions(e.EpisodeID) as Companions,
	dbo.fnEnemies(e.EpisodeID) as Enemies
FROM
		Episode e left join
			Doctor d on e.DoctorID = d.DoctorID
		left join
			Author a on e.AuthorID = a.AuthorID 

