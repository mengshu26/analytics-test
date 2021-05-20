## Fetch Data Model

This document will show: 

 - ERD of data model optimized for analytics 
 - Loading data into a Postgres 
 - Transform the data using dbt
 - Query the database 
 - Evaluate data quality
 - Send email to Stakeholder 
 
### ERD 
1. There are many ways to model this data. Since we're running analytics on this, we'll use an OLAP approach. Less normalization and less joins needed to perform analytical queries 
2. There were several fields that weren't documented, which were discovered through `Fetch_EDA.ipynb` , most of these are describing qualities of specific items on a receipt, nested in a json field. A separate items table would be optimal here. Refer to `Fetch_ER_Diagram (1).pdf`  


### Loading data into Postgres

1. Have postgres installed! check out their [website](https://www.postgresql.org/download/)
2. Create target database. There are many ways to do this, I used this [tutorial](https://www.robinwieruch.de/postgres-sql-macos-setup) to get me started
At a high level, it was these commands
```
initdb /usr/local/var/postgres
pg_ctl -D /usr/local/var/postgres start
createdb postgres
```

3. I then used Dbeaver to interact with the database 
 - connect to the database using dbeaver 
 - create the tables using this command in dbeaver: `CREATE TABLE fetch_takehome.receipts (json_txt jsonb);`
 - copy the data into the table on the command line using this: 
`cat receipts.json | psql -h localhost -p 5432 postgres -U postgres -c "COPY fetch_takehome.receipts (json_txt) FROM STDIN;"`


### Transform Data with dbt 
1. check if dbt is installed by `dbt --version` in the command line, here are [instructions](https://docs.getdbt.com/dbt-cli/installation/) if it isn't 

2. add a connection to the local Postgres database for this model. If it doesn't exist, create a profiles.yml file in the ~/.dbt/ directory. use [this](https://docs.getdbt.com/reference/warehouse-profiles/postgres-profile/) as a template if necessary. 

3. Once the profiles.yml is set up, run `dbt debug` to check that the connection works.

4. `dbt run` in the command line to create the transformations!

### Query the database to answer business questions 
- refer to `queries.sql`


### checking data quality 
- there are definitely a lot to be worked on in terms of data quality, generally I will start with checking that tables are joinable, and for duplications. refer to `data_quality.sql`

### Send an email to a stakeholder
- assuming the stakeholder is in product. Refer to `email.txt`
