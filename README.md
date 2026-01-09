# Housing Price Analysis: Netherlands & Europe 
<img width="auto" height="auto" alt="A banner with a bright blue background featuring the white text: Housing Price Analysis in a large font, with NETHERLANDS & EUROPE written in a smaller font below it. The sides of the banner are decorated with simple white line illustrations of traditional multi-story European-style houses." src="https://github.com/user-attachments/assets/7c4131fc-7f27-40bd-aab0-ba79d99d59de" />

## Tableau Dashboard
https://public.tableau.com/views/HousepricetrendsinEurope2022-2025/Dashboard_housing?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

---
### Project Overview
This project analyzes the **house price trends in the Netherlands and other European countries since 2020**, using official Eurostat data. The goal is to understand how Dutch house prices have changed compared to neighboring countries, and to provide insights for potential policy, investment, or business decisions.

**Key Questions:**
- How have house prices in the Netherlands evolved since COVID-19?
- How do Dutch house prices compare to other European countries?
- Which countries have experienced the highest growth in house prices?

---

## Dataset
**Source:** [Eurostat – House Price Index](https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Housing_price_statistics_-_house_price_index#Data_sources)  
**Format:** CSV  
**Columns include:**
- `geo` – Country name
- `TIME_PERIOD` – YEAR & Quarter of the data
- `OBS_VALUE` – House price index

**Notes:**
- Only years 2019–2025 are considered for this analysis.
- Missing values were removed and duplicates were filtered.

---

## Tools & Skills
- **SQL (PostgreSQL):** Data cleaning, transformation, aggregation, and analysis  
- **Data Analysis Skills:** Time-series analysis, cross-country comparison, KPI calculation  
- **Analytical Thinking:** Framing business questions, deriving insights, presenting actionable recommendations

---

### Analysis Steps

## Step 1 Exlopre the data
``` 
SELECT DISTINCT *
FROM housing_europe he
LIMIT 15; 
```

## Step 2 Check for missing values
``` 
SELECT *
FROM housing_europe he 
WHERE he."OBS_VALUE" IS NULL;
```

## Step 3 create a cleaned table
```
CREATE TABLE house_price_index_cleaned AS
SELECT he.geo , he."TIME_PERIOD" , he."OBS_VALUE" 
FROM housing_europe he
WHERE he."OBS_VALUE" IS NOT null
ORDER BY he."OBS_VALUE" DESC;
```

## Step 4 Trend over time in the Netherlands
```
SELECT hp."TIME_PERIOD", AVG(hp."OBS_VALUE") AS avg_price_index_nl
FROM house_price_index_cleaned hp
WHERE hp.geo = 'Netherlands'
GROUP BY hp."TIME_PERIOD"
ORDER BY hp."TIME_PERIOD" DESC;
```


## Step 5 Netherlands vs EU comparison, calculate average house price index per country 
```
SELECT hp.geo, hp."TIME_PERIOD", AVG(hp."OBS_VALUE") AS avg_price_index
FROM house_price_index_cleaned hp
GROUP BY hp.geo, hp."TIME_PERIOD"
ORDER BY avg_price_index DESC;
```

### Key Insights – Netherlands vs EU Comparison

- **Netherlands housing growth:**  
  The house price index for the Netherlands increased steadily from approximately **183 in 2023-Q1** to **213 in 2025-Q2**, indicating a strong upward trend over the last 2–3 years. This shows consistent growth in the Dutch housing market.

- **Top growth countries:**  
  Countries such as **Turkey (~1569–1885)**, **Hungary (~259–353)**, and **Iceland (~198–262)** have the highest house price indices in recent quarters, surpassing the Netherlands. This highlights rapid growth in emerging or smaller markets compared to Western Europe.

- **Comparison to EU peers:**  
  Western European countries like **Germany, Ireland, and Austria** show moderate growth with 2025-Q2 index values around **164–166**. Southern and Eastern European countries show wider variation, from **~169 (Luxembourg)** to **~353 (Hungary)**, reflecting diverse housing market trends across Europe.

- **Investment and policy implications:**  
  The Netherlands exhibits strong housing demand, making it attractive for investors. However, some EU markets show faster growth, which can inform cross-country investment strategies and housing policy decisions.

- **Visualization suggestions:**  
  - **Line chart:** Show Netherlands trend over time (2023–2025)  
  - **Bar chart:** Compare average house price index by country in 2025-Q2
  
## 👤 Contact
- Eliza C. Huang | Data Analyst with a background in UX research and data-driven analysis. Interested in roles within public policy, NGOs, human rights, and social impact organizations.
- Portfolio / Data Visualizations: Instagram – DataDrawers
- LinkedIn: [https://www.linkedin.com/in/chuyunh/]



