SELECT FOOD_TYPE, REST_ID, REST_NAME, R.FAVORITES
FROM REST_INFO AS R
INNER JOIN
(SELECT MAX(FAVORITES) AS FAVORITES
FROM REST_INFO
GROUP BY FOOD_TYPE
ORDER BY FAVORITES DESC) AS F
ON R.FAVORITES = F.FAVORITES
GROUP BY FOOD_TYPE
ORDER BY FOOD_TYPE DESC