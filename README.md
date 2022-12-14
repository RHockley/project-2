# ETL PROJECT

**Group members: Carlos Soda, Nick Carr, Liam Twomey, Robbie Hockley**

---

## Project Specialisation Brief

In UWA’s anthropology department, the lead analyst wants to collect data from different sources in order to compile a database they can use to analyse and explore the social and economic relationships between economies, average heights and the body mass index’s of populations around the world. 

The dataset produced covers ten economic and social indicators from 200 countries worldwide. The primary purpose of the dataset is to enable study into the relationship between economic and population health metrics. 


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

Excel was used to do some basic cleaning of the datasets. This was to remove any columns that were irrelevent to the question that was being investigated. There were approximately 30 rows that contained countries which weren't consistent across all of the datasets. This allows the joining of dataframes further into the _Transform_ section.

The image below is the raw `country_profiles_variables.csv` dataset from the source. The columns in blue were removed to make the information contained within it relevant

![Image](images/country_profile_variables_before.png)

Pandas was then used to transform the .csv files into dataframes that could be further manipulated and joined together. Further cleaning was performed to remove more irrelevent data.

Columns dropped included:
* `Labour force participation (female/male pop. %)`
* `Urban population growth rate (average annual %)`
* `Fertility rate, total (live births per woman)`
* `Life expectancy at birth (females/males, years)`
* `Population age distribution (0-14 / 60+ years, %)`
* `International migrant stock (000/% of total pop.)`
* `Refugees and others of concern to UNHCR (in thousands)`
* `Infant mortality rate (per 1000 live births`
* `Health: Physicians (per 1000 pop.)`,`Education: Government expenditure (% of GDP)`
* `Education: Primary gross enrol. ratio (f/m per 100 pop.)`
* `Education: Secondary gross enrol. ratio (f/m per 100 pop.)`
* `Education: Tertiary gross enrol. ratio (f/m per 100 pop.)`
* `Seats held by women in national parliaments %`
* `Mobile-cellular subscriptions (per 100 inhabitants)`
* `Mobile-cellular subscriptions (per 100 inhabitants)`
* `Individuals using the Internet (per 100 inhabitants)`
* `Threatened species (number)`
* `Forested area (% of land area)`
* `CO2 emission estimates (million tons/tons per capita)`
* `Energy production, primary (Petajoules)'`
* `Energy supply per capita (Gigajoules)`
* `Pop. using improved drinking water (urban/rural, %)`
* `Pop. using improved sanitation facilities (urban/rural, %)`
* `Net Official Development Assist. received (% of GNI)`

As these didn't add to the information that was being investigated.

An `id` column was added to act as a primary key. This is an identifying integer that increases by 1 for each row in the dataframe.

![Image](images/jupyter_notebook_dataframe.png)

The dataframes were moved to a database in pgAdmin for storage and SQL searches. The image below is from a Jupyter Notebook to confirm the addition to the database. A simple SQL search to return information from the database can confirm that the data had been stored correctly.

![Image](images/database_check.png)

[Back to top](#etl-project)

---
## 4. DATABASE SCHEMATA


The following code was used to create an ERD from [Quickbasediagrams](https://app.quickdatabasediagrams.com/#/d/BOWxp6).

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