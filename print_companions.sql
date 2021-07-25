CREATE FUNCTION fnCompanions
(
	@EpisodeId AS int
)
RETURNS VARCHAR(MAX) AS
BEGIN
DECLARE @Output AS VARCHAR(2048) =''
DECLARE @CompanionName AS varchar(64)
Declare CompanionCursor Cursor FOR
	(SELECT c.CompanionName
	FROM EpisodeCompanion as ec INNER JOIN 
		Companion as c on ec.CompanionID = c.CompanionID
	WHERE EpisodeID = @EpisodeId)
	

OPEN CompanionCursor

FETCH NEXT FROM CompanionCursor
INTO @CompanionName

SET @Output = @CompanionName

WHILE @@FETCH_STATUS = 0
BEGIN
	
FETCH NEXT FROM CompanionCursor
INTO @CompanionName

SET @Output = CONCAT_WS(', ',@Output,@CompanionName)

END

CLOSE CompanionCursor
DEALLOCATE CompanionCursor
RETURN @Output
END