WITH NonAppearingCompanions(id)
AS (
	SELECT c.CompanionID
	FROM 
		Companion AS c left join
		EpisodeCompanion AS ec ON ec.CompanionID = c.CompanionID
	WHERE ec.CompanionID is null
)

DELETE 
FROM Companion
WHERE CompanionID in (SELECT * FROM NonAppearingCompanions)


