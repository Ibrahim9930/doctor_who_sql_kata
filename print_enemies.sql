CREATE FUNCTION dbo.fnEnemies
(
	@EpisodeId AS int
)
RETURNS VARCHAR(MAX) AS
BEGIN
DECLARE @Output AS VARCHAR(2048) =''
DECLARE @EnemyName AS varchar(64)
Declare EnemyCursor Cursor FOR
	(SELECT e.EnemyName
	FROM EpisodeEnemy as ee INNER JOIN 
		Enemy as e on e.EnemyID = ee.EnemyID
	WHERE EpisodeID = @EpisodeId)
	

OPEN EnemyCursor

FETCH NEXT FROM EnemyCursor
INTO @EnemyName

SET @Output = @EnemyName

WHILE @@FETCH_STATUS = 0
BEGIN
	
FETCH NEXT FROM EnemyCursor
INTO @EnemyName

SET @Output = CONCAT_WS(', ',@Output,@EnemyName)

END

CLOSE EnemyCursor
DEALLOCATE EnemyCursor
RETURN @Output
END