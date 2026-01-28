CREATE DATABASE asset_fund_analytics;
USE asset_fund_analytics;

CREATE TABLE advisors (
    advisor_id VARCHAR(10) PRIMARY KEY,
    region VARCHAR(50),
    total_clients INT,
    assets_managed INT
);
CREATE TABLE funds (
    fund_id VARCHAR(10) PRIMARY KEY,
    fund_name VARCHAR(100),
    category VARCHAR(50),
    risk_level VARCHAR(20),
    expense_ratio DECIMAL(4,2)
);
CREATE TABLE fund_performance (
    performance_id INT AUTO_INCREMENT PRIMARY KEY,
    fund_id VARCHAR(10),
    month DATE,
    nav DECIMAL(10,2),
    returns_pct DECIMAL(5,2),
    benchmark_return_pct DECIMAL(5,2),
    FOREIGN KEY (fund_id) REFERENCES funds(fund_id)
);
CREATE TABLE aum (
    aum_id INT AUTO_INCREMENT PRIMARY KEY,
    fund_id VARCHAR(10),
    month DATE,
    aum_crore INT,
    inflow INT,
    outflow INT,
    FOREIGN KEY (fund_id) REFERENCES funds(fund_id)
);




#Question 1: Show all records from the advisors table.
SELECT * 
FROM advisors;

#Question 2: Show all records from the funds table.
SELECT * 
FROM funds;

#Question 3: How many advisors are there in total?
SELECT COUNT(*) AS total_advisors
FROM advisors;

#Question 4: Show the number of advisors in each region.
SELECT region, COUNT(advisor_id) AS advisor_count
FROM advisors
GROUP BY region;

#Question 5: Show total clients handled in each region.
SELECT region, SUM(total_clients) AS total_clients
FROM advisors
GROUP BY region;

#Question 6: Show total assets managed in each region.
SELECT region, SUM(assets_managed) AS total_assets_managed
FROM advisors
GROUP BY region;

#Question 7: Find the advisor who manages the highest assets.
SELECT advisor_id, region, assets_managed
FROM advisors
ORDER BY assets_managed DESC
LIMIT 1;

#Question 8: Find the average assets managed by advisors.
SELECT AVG(assets_managed) AS average_assets
FROM advisors;

#Question 9: How many mutual funds are available?
SELECT COUNT(*) AS total_funds
FROM funds;

#Question 10: Show number of funds in each category.

SELECT category, COUNT(fund_id) AS fund_count
FROM funds
GROUP BY category;

#Question 11: Show number of funds based on risk level.
SELECT risk_level, COUNT(fund_id) AS fund_count
FROM funds
GROUP BY risk_level;

#Question 12: Find the fund with the highest expense ratio.
SELECT fund_name, expense_ratio
FROM funds
ORDER BY expense_ratio DESC
LIMIT 1;

#Question 13: Find the fund with the lowest expense ratio.
SELECT fund_name, expense_ratio
FROM funds
ORDER BY expense_ratio ASC
LIMIT 1;

#Question 14: Find the average expense ratio for each fund category.
SELECT category, AVG(expense_ratio) AS average_expense_ratio
FROM funds
GROUP BY category;

#Question 15: Display all funds that belong to the Equity category.
SELECT *
FROM funds
WHERE category = 'Equity';

#Question 16: Display funds with High or Medium risk level.
SELECT *
FROM funds
WHERE risk_level IN ('High', 'Medium');

#Question 17: Show advisors who manage assets greater than 300.
SELECT *
FROM advisors
WHERE assets_managed > 300;

#Question 18: Show all advisors from the North region.
SELECT *
FROM advisors
WHERE region = 'North';

#Question 19: Display advisors sorted by assets managed in descending order.
SELECT *
FROM advisors
ORDER BY assets_managed DESC;

#Question 20: Display funds sorted by expense ratio in ascending order.
SELECT *
FROM funds
ORDER BY expense_ratio ASC;

#Final Question: Which fund category has the lowest average expense ratio?
SELECT category, AVG(expense_ratio) AS average_expense
FROM funds
GROUP BY category
ORDER BY average_expense ASC
LIMIT 1;