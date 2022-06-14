--資料來源：https://data.gov.tw/dataset/151770
--政府資料開放平台 地區年齡性別統計表-嚴重特殊傳染性肺炎(以日為單位)
--這次專案都以2020年至2021年為主
--資料已經先去除2022年的數據
--建立資料集
CREATE TABLE covidcase_tw(
	case_no int,
	yyyy_m_dd date,
	year_month varchar(10),
	county varchar(10),
	district varchar(10),
	gender varchar(5),
	age varchar(10),
	confirmed_case int
)

--手動Import資料
--Age_County_Gender_day_19Cov_EDITED_Ver2_ENG.csv
 

--大概掌握資料概況
SELECT * FROM covidcase_tw
LIMIT 10;

--總確診數
SELECT SUM(confirmed_case) FROM covidcase_tw;

--透過條件篩選以及GROUP BY來取得每月確診數
SELECT year_month, sum(confirmed_case) FROM covidcase_tw
GROUP BY year_month
ORDER BY SUM(confirmed_case) DESC
LIMIT 10;

--以GROUP BY城市來取得2020年至2021年的總確診數
--依縣市統計總確診數遞減排序 取得前5筆
SELECT county, sum(confirmed_case) FROM covidcase_tw
GROUP BY county
ORDER BY sum(confirmed_case) DESC
LIMIT 5;

--依照年紀區段找出總確診數
SELECT age,sum(confirmed_case) FROM covidcase_tw
GROUP BY age
ORDER BY SUM(confirmed_case) DESC
LIMIT 5;

--依照性別計算確診
SELECT gender,sum(confirmed_case) FROM covidcase_tw
GROUP BY gender
ORDER BY SUM(confirmed_case) DESC;

--計算各時期的確診總數和最大的前5名
SELECT year_month, 
	SUM(confirmed_case) AS sum_confirmed_case FROM covidcase_tw
GROUP BY year_month
ORDER BY SUM(confirmed_case) DESC
LIMIT 5;

--找出2020~2021年期間前5大多的確診區域
SELECT county, district, sum(confirmed_case) FROM covidcase_tw
GROUP BY county ,district
ORDER BY sum(confirmed_case) DESC
LIMIT 5;
