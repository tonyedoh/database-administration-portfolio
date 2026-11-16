\# Temporary SQL Server Administrative Access (30 Minutes)



\## Project Overview



This project demonstrates how a SQL Server Database Administrator can provide a consultant with temporary administrative access to a SQL Server instance and automatically disable that access after 30 minutes.



The solution uses SQL Server Authentication and SQL Server Agent.



\## Business Scenario



A company hires an external consultant who needs administrative access to its SQL Server instance for a limited period of 30 minutes.



As the DBA, my responsibilities are to:



1\. Create a SQL Server login for the consultant.

2\. Grant the required administrative privileges.

3\. Configure a one-time SQL Server Agent job to disable the login after 30 minutes.

4\. Verify that the consultant can no longer authenticate after the access period expires.



\## Technologies Used



\- Microsoft SQL Server 2022

\- SQL Server Management Studio (SSMS)

\- SQL Server Agent

\- T-SQL



\## Implementation



\### Step 1: Create the Consultant Login



Created a SQL Server login named `ConsultantLogin`.



\### Step 2: Grant Administrative Privileges



Added `ConsultantLogin` to the `sysadmin` fixed server role for the duration of the approved access period.



\### Step 3: Configure Automatic Access Expiration



Created a one-time SQL Server Agent job scheduled to execute after 30 minutes.



The job disables the consultant login using:



```sql

ALTER LOGIN \[ConsultantLogin] DISABLE;

```



\### Step 4: Verify the Job Execution



After 30 minutes, I checked SQL Server Agent Job History and confirmed that the job completed successfully.



\### Step 5: Test the Login



I attempted to connect again using `ConsultantLogin`.



SQL Server returned:



\*\*Login failed for user 'ConsultantLogin'. Reason: the login is disabled.\*\*



This confirmed that the automated access-expiration process worked successfully.



\## Outcome



Successfully demonstrated how to:



\- Create a SQL Server login.

\- Assign server-level administrative privileges.

\- Schedule a one-time SQL Server Agent job.

\- Automatically disable a login after a defined period.

\- Verify access revocation through a login test.



\## Security Considerations



The `sysadmin` role grants extensive control over the SQL Server instance. In a production environment, administrative access should follow the principle of least privilege.



Disabling a login prevents new authentication but does not automatically terminate sessions that were already connected. Existing sessions should be reviewed and, where appropriate, terminated when temporary access expires.



Disabling the login also preserves the login object for auditing and review. It is different from dropping or deleting the login.



\## Project Type



Self-directed SQL Server DBA hands-on lab.



\*\*Note:\*\* This project demonstrates practical lab experience, not production DBA employment experience.

