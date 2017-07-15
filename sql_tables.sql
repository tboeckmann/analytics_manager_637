-- Table: public.kickstarter_projects

-- 
DROP TABLE public.kickstarter_projects;

CREATE TABLE public.kickstarter_projects
(

project_id varchar,             -- unique id of project
name varchar,                   -- name of the project
description varchar,                   -- description of project
goal varchar,                   -- the goal (amount) required for the project
keywords varchar,               -- keywords which describe project
disable_communication boolean,  -- whether the project authors has disabled communication option with people donating to the project
country varchar,                -- country of project author
currency varchar                -- currency in which goal (amount) is required

)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.kickstarter_projects
  OWNER TO startupanalytics;
GRANT ALL ON TABLE public.kickstarter_projects TO startupanalytics;
GRANT SELECT ON TABLE public.kickstarter_projects TO analyticsmanager;

-- Table: public.kickstarter_results

-- 
DROP TABLE public.kickstarter_results;

CREATE TABLE public.kickstarter_results
(

project_id varchar,             -- unique id of project
deadline timestamp,             -- date the goal must be achieved by
state_changed_at timestamp,     -- time the project status changed. Status could be successful, failed, suspended, cancelled etc.
created_at timestamp,           -- time the project was posted on the website
launched_at timestamp,          -- time the project went live on the website
backers_count integer,          -- number of people who backed the project
final_status integer            -- whether the project got successfully funded (target variable – 1,0)

)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.kickstarter_results
  OWNER TO startupanalytics;
GRANT ALL ON TABLE public.kickstarter_results TO startupanalytics;
GRANT SELECT ON TABLE public.kickstarter_results TO analyticsmanager;
