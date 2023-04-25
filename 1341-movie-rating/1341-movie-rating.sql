# 가장 많은 수의 영화를 평가한 사용자의 이름을 찾으십시오. 동점인 경우 사전순으로 더 작은 사용자 이름을 반환합니다.
# 2020년 2월 평균 평점이 가장 높은 영화 이름을 찾습니다. 동률인 경우 사전순으로 더 작은 영화 이름을 반환합니다.
(
SELECT U.name AS results
FROM MovieRating R LEFT JOIN Users U USING(user_id)
    GROUP BY R.user_id
    ORDER BY COUNT(R.movie_id) DESC, U.name
    LIMIT 1
)
UNION ALL
(
SELECT M.title AS results
FROM MovieRating R LEFT JOIN Movies M USING(movie_id)
    WHERE R.created_at LIKE '2020-02%'
    GROUP BY R.movie_id
    ORDER BY AVG(R.rating) DESC, M.title -- 평점 높은 순, 이름순으로
    LIMIT 1
)