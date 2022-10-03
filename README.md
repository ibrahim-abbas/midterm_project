# midterm_project

### Overview
For this midterm project, we explored the relationship between carbon levels (CO2) and 
global temperatures across time. We focused on 63 regions with over 90 countries within 
the span of 1990-2013.

### Data Sources:
We used two data sources that comprised of six files from:
- Kaggle Data Set (Berkeley Earth) - https://www.kaggle.com/datasets/berkeleyearth/climate-change-earth-surface-temperature-data
- OECD Data Set - https://stats.oecd.org/Index.aspx?DataSetCode=AIR_GHG

### ETL Process:
We first cleaned the different files involved including:
 - Deleting excess columns in OECD data set.
 - Asserting datatypes to match schema creation in Postgres.
 - Filtering out only countries in the Kaggle Berkeley Earth Data set to only include those
 in the OECD data set.
 - Normalizing Kaggle temperature dataset country names to match those in OECD.

### Group Members:
- Alecia Gulledge
- Ibrahim Abbas
- Jessica Camacho
- Opeyemi Adeniran
- Russell Akram

