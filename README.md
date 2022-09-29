# ETL PROJECT

Group members: Carlos Soda, Nick Carr, Liam Twomey, Robbie Hockley

---
1. [Selection of Datasets](#selection-of-datasets)
2. [Description of Datasets](#description-of-datasets)
3. [Transformation of Datasets](#transformation-of-datasets)
4. [Database Schemata](#database-schemata)
---
## 1. SELECTION OF DATASETS

Sources:  
*  [Country Statistics UNdata](https://www.kaggle.com/datasets/sudalairajkumar/undata-country-profiles) - Srk (2017) Download (43 kB) Country Statistics UNData | Overview. This dataset contains key statistical indicators covering General Information Economic Indicators Social Indicators Environmental & Infrastructure Indicators.
* [Height of Male and Female by Country 2022](https://www.kaggle.com/datasets/majyhain/height-of-male-and-female-by-country-2022) - Majyhain (2022) Download (4 kB) Height of Male and Female by Country | Overview This dataset contains tallest to smallest average heights of males and females by country covering rank, country name, male height and female height.
* [Global status report on noncommunicable diseases 2014](https://www.who.int/publications/i/item/9789241564854) - WHO (2014). Download (6.7 MB) Global status report on noncommunicable diseases | Overview The report provides data on the current situation, identifying bottlenecks as well as opportunities and priority actions for attaining global targets.

[Back to top](#etl-project)

---
## 2. DESCRIPTION OF DATASETS

* `country_profile_variables.csv` - In depth look at categorical factors covering population and infrastructre by country
* `height_of_male_and_female_by_country.csv` - average height of males and females by country.
* `world_bmi.csv` - average BMI of males, females, and both genders by country.

[Back to top](#etl-project)

---
## 3. TRANSFORMATION OF DATASETS

Excel was used to do some basic cleaning of the datasets. This was to remove any columns that were irrelevent to the question that was being investigated.

The image below is the raw `country_profiles_variables.csv` dataset from the source. The columns in blue were removed to make the information contained within it relevant

![Image](images/country_profile_variables_before.png)

Pandas was then used to transform the .csv files into dataframes that could be further manipulated and joined together. An `id` column was added to act as a primary key.

![Image](images/jupyter_notebook_dataframe.png)

The dataframes were moved to a database in pgAdmin for storage and SQL searches. The image below is from a Jupyter Notebook to confirm the addition to the database.

![Image](images/database_check.png)

[Back to top](#etl-project)

---
## 4. DATABASE SCHEMATA

[Quickbasediagrams](https://app.quickdatabasediagrams.com/#/d/BOWxp6) was used to create an ERD.

```text
CREATE TABLE "country_profile_variables" (
    "id" int   NOT NULL,
    "country" string   NOT NULL,
    "region" string   NOT NULL,
    "Surface_area_(km^2)" int   NOT NULL,
    "Population_in_thousands_(2017)" int   NOT NULL,
    "Population_density_(per_km2,_2017)" float   NOT NULL,
    "Sex_ratio_(m_per_100_f,_2017)" float   NOT NULL,
    "GDP:_Gross_domestic_product_(million_current_US$)" int   NOT NULL,
    "GDP_growth_rate_(annual_%,_const._2005_prices)" float   NOT NULL,
    "GDP_per_capita_(current_US$)" float   NOT NULL,
    "Economy:_Agriculture_(%_of_GVA)" float   NOT NULL,
    "Economy:_Industry_(%_of_GVA)" float   NOT NULL,
    "Economy:_Services_and_other_activity_(%_of_GVA)" float   NOT NULL,
    "Employment:_Agriculture_(%_of_employed)" float   NOT NULL,
    "Employment:_Industry_(%_of_employed)" float   NOT NULL,
    "Employment:_Services_(%_of_employed)" float   NOT NULL,
    "Unemployment_(%_of_labour_force)" float   NOT NULL,
    "Population_growth_rate_(average_annual_%)" float   NOT NULL,
    "Health:_Total_expenditure_(%_of_GDP)" float   NOT NULL,
    CONSTRAINT "pk_country_profile_variables" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "physical_indicators" (
    "id" int   NOT NULL,
    "Country_name" string   NOT NULL,
    "male_height_in_cm" float   NOT NULL,
    "female_height_in_cm" float   NOT NULL,
    "body_mass_male_(kg/m2)" float   NOT NULL,
    "body_mass_female_(kg/m2)" float   NOT NULL,
    CONSTRAINT "pk_physical_indicators" PRIMARY KEY (
        "id"
     )
);
```
![Image](images/database_schema.png)

[Back to top](#etl-project)

---
©2022