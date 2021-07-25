use [Doctor Who]

DECLARE @NewTitle varchar(255) = '';

UPDATE Episode
SET  
	@NewTitle = CONCAT(Episode.Title , '_CANCELLED'),
	TITLE = @NewTitle
WHERE DoctorID is null

