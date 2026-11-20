\# SQL Server User Access Management and Read-Only Security



\## Project Overview



This project demonstrates how a SQL Server Database Administrator can manage database user access and enforce read-only permissions using SQL Server logins, database users, and fixed database roles.



\## Business Scenario



A company has a database containing customer information. A developer requires permission to view customer records but must not be allowed to insert, update, or delete data.



As the DBA, I was responsible for configuring and testing the appropriate security permissions.



\## Technologies Used



\- Microsoft SQL Server 2022

\- SQL Server Management Studio (SSMS)

\- Transact-SQL (T-SQL)

\- SQL Server Logins and Database Users

\- Database Roles and Permissions



\## Implementation



\### 1. Database Creation



Created a training database named `UserAccessLab`.



\### 2. Table Creation



Created `dbo.Customers` and inserted five sample customer records.



\### 3. SQL Server Login Creation



Created a SQL Server login named `Developer01`.



\### 4. Database User Mapping



Created a database user named `Developer01` and mapped it to the server login.



\### 5. Read-Only Permission Assignment



Added `Developer01` to the `db\_datareader` fixed database role.



\### 6. Permission Testing



Connected to SQL Server using the actual `Developer01` login and tested the permissions.



\## Test Results



| Operation | Result

| SELECT | Successful 

| INSERT | Permission Denied 

| UPDATE | Permission Denied 

| DELETE | Permission Denied



\## Outcome



Successfully demonstrated how to:



\- Create and manage SQL Server logins.

\- Map server logins to database users.

\- Assign database role membership.

\- Implement read-only database access.

\- Test and verify database permissions using a non-administrative login.



\## Security Concepts Demonstrated



\- Principle of Least Privilege.

\- SQL Server Authentication.

\- Database User Management.

\- Fixed Database Roles.

\- Permission Validation.



\## Project Type



Self-directed SQL Server DBA hands-on lab.



\*\*Note:\*\* This project demonstrates practical lab experience and is not a claim of professional production DBA employment experience.

