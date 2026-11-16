## Create the login:

CREATE LOGIN ConsultantLogin
WITH PASSWORD = 'ConsultantLogin@123'

  CHECK_POLICY = ON,
  CHECK_EXPIRATION = ON;
GO

## Assigning the sysadmin role:

ALTER SERVER ROLE sysadmin
ADD MEMBER ConsultantLogin;
GO

## Configuring the SQL Server Agent Job:

USE msdb;
GO

DECLARE @JobID UNIQUEIDENTIFIER;
DECLARE @RunDate INT;
DECLARE @RunTime INT;

SET @RunDate = CONVERT(INT,
    CONVERT(CHAR(8), GETDATE(), 112));

SET @RunTime = CONVERT(INT,
    REPLACE(CONVERT(CHAR(8),
        DATEADD(MINUTES, 30, GETDATE()), 108), ':', ''));

EXEC sp_add_job
    @job_name = 'Remove Consultant Sysadmin Access',
    @enabled = 1,
    @description = 'Removes temporary sysadmin privileges.',
    @job_id = @JobID OUTPUT;

EXEC sp_add_jobstep
    @job_id = @JobID,
    @step_name = 'Remove Sysadmin Role',
    @subsystem = 'TSQL',
    @database_name = 'master',
    @command = '
        ALTER SERVER ROLE sysadmin
        DROP MEMBER ConsultantLogin;

        ALTER LOGIN ConsultantLogin DISABLE';

EXEC sp_add_schedule
    @schedule_name = '30 MINUTES Consultant Access',
    @enabled = 1,
    @freq_type = 1,
    @active_start_date = @RunDate,
    @active_start_time = @RunTime;

EXEC sp_attach_schedule
    @job_id = @JobID,
    @schedule_name = '30 MINUTES Consultant Access';

EXEC sp_add_jobserver
    @job_id = @JobID;
GO