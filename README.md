## Fetch Data Model

This document will show: 

 - ERD of data model optimized for analytics 
 - Loading data into a Postgres 
 - Transform the data using dbt
 - Query the database 
 - Evaluate data quality
 - Send email to Stakeholder 
 


Do you have postgres installed?
Do you have dbt installed? Yes? You have postgres installed!
If not, instructions can be found on their website
Create your target database
There are many ways to do this, but I used this tutorial to get me started
At a high level, it was these commands
initdb /usr/local/var/postgres
pg_ctl -D /usr/local/var/postgres start
createdb netlify_takehome
After this I used Postico, because using a CLI to interact with a database makes me uncomfortable
Connect to the database with Postico
All you should need to change from default is the database
Mine is called netlify_takehome
Those same credentials will be used in your target config
An example can be found in configs/target-postgres
Let it fly
Run your tap and pipe it to the target using proper configs
~/.virtualenvs/tap-github/bin/tap-github --config tap-github-config.json --properties properties.json | ~/.virtualenvs/target-postgres/bin/target-postgres --config target-postgres-config.json >> state.json
Transform the data with dbt
In this example, we will be using the dbt CLI, you can check if you have it installed by typing dbt --version in the command line. If it isn't installed, please review their official instructions.

You will need to checkout the repository from GitHub, or receive the files in a .zip

Before you can run the transformations you will need to add a connection to the local Postgres database for this model.

If it doesn't exist, create a profiles.yml file in the ~/.dbt/ directory. You can use this page from the dbt docs as a template. Replate company-name with github_data_model

Once you have the profiles.yml set up, run dbt debug to check that your connection works.

Once that is done, you should be able to dbt run and create the transformations. To view docs, run dbt docs generate and then dbt docs serve.
