Nashville Housing Market Analysis Report
Introduction
This report provides a comprehensive analysis of the Nashville housing market using transactional and property data extracted from the NashvilleHousingData database. The aim of this analysis is to uncover trends and insights relating to property distribution, sales performance, valuation, tax districts, and property characteristics such as bedroom count and occupancy status.

The data underwent cleaning and transformation to ensure consistency and accuracy in analysis—particularly addressing inconsistencies in the LandUse column and converting relevant fields like TotalValue to appropriate numerical types.

Through structured SQL queries, key performance metrics were derived to support decision-making for urban planners, investors, real estate professionals, and local authorities.
1. Data Preparation
Before analysis, data cleaning and transformation steps were performed:
- Standardized inconsistent entries in the LandUse column (e.g., 'GREENBELT' and 'VACANT RESIDENTIAL LAND').
- Converted TotalValue to INT for proper numerical analysis.
2. Property Distribution by Land Use
The dataset shows how properties are distributed across different land use categories. The total number of properties and average property value for each category were computed.

Key Findings:
- Residential properties dominate in quantity.
- Commercial and industrial properties have higher average values.
- Greenbelt and vacant land types are lower in value.
3. Total Sales and Profitability by Land Use
Sales performance was evaluated by aggregating the number of properties sold, total sales value, and total profit (Sale Price - Total Value) by land use type.

Key Insights:
- Residential land has the highest quantity sold and generates the most revenue.
- Commercial properties generate significant profits despite fewer transactions.
- Vacant land categories, while lower in volume, can also yield notable margins.
4. Top 10 Most Valued Properties
The top 10 properties by TotalValue were extracted to identify the most valued assets in the dataset.

Observation:
- These high-value properties are mostly large-scale commercial or industrial assets.
- They contribute significantly to total valuation and potential revenue.
5. Yearly Sales Trend
An analysis of property sales over the years provides insight into market trends and fluctuations.

Findings:
- Steady annual transaction volumes indicate a relatively stable market.
- Average sale prices show fluctuations, possibly tied to economic trends or policy shifts.
6. Tax District Analysis
Sales were grouped by TaxDistrict to understand fiscal segmentation within the city.

Key Points:
- Some tax districts have notably higher transaction volumes and revenues.
- Identifying high-performing districts can guide investment and policy focus.
7. Bedroom Analysis
The correlation between the number of bedrooms and property sales volume was examined.

Trends Identified:
- 3-bedroom properties are the most common and most sold.
- Properties with more bedrooms tend to command higher prices, aligning with buyer expectations.
8. Vacancy Status Analysis
The status of properties (vacant vs. occupied) was analyzed in terms of sales.

Summary:
- Occupied properties dominate the market in terms of quantity and total sales.
- Vacant properties still represent a significant share, especially among new developments or investment listings.
Conclusion
This analysis of the Nashville housing market reveals significant trends and patterns in property distribution, sales, valuation, and tax dynamics. These insights can support informed decision-making for various stakeholders in the real estate ecosystem, including policymakers, investors, and city planners.
