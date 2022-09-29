-- Create tables for raw data to be loaded into
CREATE TABLE country_profile_variables (
"id" INT PRIMARY KEY,
"Country" TEXT,
"Region" TEXT,
"Surface area (km2)" INT,
"Population in thousands (2017)" INT,
"Population density (per km2, 2017)" FLOAT,
"Sex ratio (m per 100 f, 2017)" FLOAT,
"GDP: Gross domestic product (million current US$)" INT,
"GDP growth rate (annual %, const. 2005 prices)" FLOAT,
"GDP per capita (current US$)" FLOAT,
"Economy: Agriculture (% of GVA)" FLOAT,
"Economy: Industry (% of GVA)" FLOAT,
"Economy: Services and other activity (% of GVA)" FLOAT,
"Employment: Agriculture (% of employed)" FLOAT,
"Employment: Industry (% of employed)" FLOAT,
"Employment: Services (% of employed)" FLOAT,
"Unemployment (% of labour force)" FLOAT,
"Labour force participation (female/male pop. %)" FLOAT,
"Population growth rate (average annual %)" FLOAT,
"Population age distribution (0-14 / 60+ years, %)" FLOAT,
"Health: Total expenditure (% of GDP)" FLOAT
);

CREATE TABLE physical_indicators (
"id" INT PRIMARY KEY,
"Country" TEXT,
"Male Height in Cm" FLOAT,
"Female Height in Cm" FLOAT,
"Boddy mass Male (kg/m2)" FLOAT,
"Boddy mass Female (kg/m2)" FLOAT
);

SELECT country_profile_variables."id", country_profile_variables."Country" , country_profile_variables."Region", country_profile_variables."Surface area (km2)" , country_profile_variables."Population in thousands (2017)", country_profile_variables."Population density (per km2, 2017)", country_profile_variables."Sex ratio (m per 100 f, 2017)" , country_profile_variables."GDP: Gross domestic product (million current US$)",
country_profile_variables."GDP growth rate (annual %, const. 2005 prices)" , country_profile_variables."GDP per capita (current US$)" , country_profile_variables."Economy: Agriculture (% of GVA)", country_profile_variables."Economy: Industry (% of GVA)", country_profile_variables."Economy: Services and other activity (% of GVA)", country_profile_variables."Employment: Agriculture (% of employed)", country_profile_variables."Employment: Industry (% of employed)" ,
country_profile_variables."Employment: Services (% of employed)" , country_profile_variables."Unemployment (% of labour force)", country_profile_variables."Population growth rate (average annual %)" , country_profile_variables."Health: Total expenditure (% of GDP)",
physical_indicators."id", physical_indicators."Male Height in Cm", physical_indicators."Female Height in Cm", physical_indicators."Boddy mass Male (kg/m2)", physical_indicators."Boddy mass Female (kg/m2)"
FROM country_profile_variables
JOIN physical_indicators
ON country_profile_variables."id" = physical_indicators."id"