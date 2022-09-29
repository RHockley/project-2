-- Create tables for raw data to be loaded into
CREATE TABLE country_profile_variables (
"id" INT PRIMARY KEY,
"country" TEXT,
"Region" TEXT,
"Surface area (km2)" TEXT,
"Population in thousands (2017)" TEXT,
"Population density (per km2, 2017)" TEXT,
"Sex ratio (m per 100 f, 2017)" TEXT,
"GDP: Gross domestic product (million current US$)" TEXT,
"GDP growth rate (annual %, const. 2005 prices)" TEXT,
"GDP per capita (current US$)" TEXT,
"Economy: Agriculture (% of GVA)" TEXT,
"Economy: Industry (% of GVA)" TEXT,
"Economy: Services and other activity (% of GVA)" TEXT,
"Employment: Agriculture (% of employed)" TEXT,
"Employment: Industry (% of employed)" TEXT,
"Employment: Services (% of employed)" TEXT,
"Unemployment (% of labour force)" TEXT,
"Labour force participation (female/male pop. %)" TEXT,
"Population growth rate (average annual %)" TEXT,
"Population age distribution (0-14 / 60+ years, %)" TEXT,
"Health: Total expenditure (% of GDP)" TEXT
);


CREATE TABLE physical_indicators (
"id" INT PRIMARY KEY,
"Country Name" TEXT,
"Male Height in Cm" TEXT,
"Female Height in Cm" TEXT,
"Boddy mass Male (kg/m2)" TEXT,
"Boddy mass Female (kg/m2)" TEXT
);

SELECT country_profile_variables."id", country_profile_variables."country" , country_profile_variables."Region", country_profile_variables."Surface area (km2)" , country_profile_variables."Population in thousands (2017)", country_profile_variables."Population density (per km2, 2017)", country_profile_variables."Sex ratio (m per 100 f, 2017)" , country_profile_variables."GDP: Gross domestic product (million current US$)",
country_profile_variables."GDP growth rate (annual %, const. 2005 prices)" , country_profile_variables."GDP per capita (current US$)" , country_profile_variables."Economy: Agriculture (% of GVA)", country_profile_variables."Economy: Industry (% of GVA)", country_profile_variables."Economy: Services and other activity (% of GVA)", country_profile_variables."Employment: Agriculture (% of employed)", country_profile_variables."Employment: Industry (% of employed)" ,
country_profile_variables."Employment: Services (% of employed)" , country_profile_variables."Unemployment (% of labour force)", country_profile_variables."Labour force participation (female/male pop. %)", country_profile_variables."Population growth rate (average annual %)" , country_profile_variables."Population age distribution (0-14 / 60+ years, %)", country_profile_variables."Health: Total expenditure (% of GDP)",
physical_indicators."id", physical_indicators."Country Name", physical_indicators."Male Height in Cm", physical_indicators."Female Height in Cm", physical_indicators."Boddy mass Male (kg/m2)", physical_indicators."Boddy mass Female (kg/m2)"
FROM country_profile_variables
JOIN physical_indicators
ON country_profile_variables."id" = physical_indicators."id"