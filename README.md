# analytics_manager_637
 
## Task Instructions:

Connect to the Postgres database using instructions found in the repository.

Analyze the dataset to produce answers to the following challenges.

You should include a doc summarizing the outputs along with the relevant data in an excel spreadsheet.

Please attach any code and SQL queries that were used.

This should be completed within 48 hours.

1) What is the average goal amount of funded projects?
2) What average goal amount of non-funded project? 
3) What are the top 20 keywords of funded projects?
3) What are the top 20 keywords of non-funded projects?
4) How many backers did successful projects have on average?  
5) Based on your findings, please produce insights (text and numbers) of your own from the funding data (with a supporting chart).


## Connecting to the Database

For the data source please use the following database and read-only user details:
```
  Database Type: Postgres 9.6
  Host: startupanalytics.cxl3zurlacnf.eu-central-1.rds.amazonaws.com:5432
  Port: 5432
  Username: analyticsmanager
  Passvvord: j38cc4srt31$1
  Database: startup_analytics
```

Note: You can use any of your preferred tools/ methods to connect to the database. Further information on connecting to a DB Instance can be found [here](http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ConnectToPostgreSQLInstance.html).

## Database Schema
The database consists of 2 tables, where `project_id` can be used to correlate the projects:

### 1. kickstarter_projects
This table contains the project details for each project.
```
  project_id varchar,             -- unique id of project
  name varchar,                   -- name of the project
  description varchar,            -- description of project
  goal varchar,                   -- the goal (amount) required for the project
  keywords varchar,               -- keywords which describe project
  disable_communication boolean,  -- whether the project authors has disabled communication option with people donating to the project
  country varchar,                -- country of project author
  currency varchar                -- currency in which goal (amount) is required
```

### 2. kickstarter_results
This table contains the dates, backers and final status for each project.

```
  project_id varchar,             -- unique id of project
  deadline timestamp,             -- date the goal must be achieved by
  state_changed_at timestamp,     -- time the project status changed. Status could be successful, failed, suspended, cancelled etc.
  created_at timestamp,           -- time the project was posted on the website
  launched_at timestamp,          -- time the project went live on the website
  backers_count integer,          -- number of people who backed the project
  final_status integer            -- whether the project got successfully funded (target variable – 1,0)
```