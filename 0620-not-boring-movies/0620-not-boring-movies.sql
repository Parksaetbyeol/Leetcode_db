# 홀수 ID와 "지루함"이 아닌 설명이 포함된 영화
SELECT *
FROM Cinema
WHERE MOD(id, 2) = 1             # mod 나머지
    AND description != 'boring'
ORDER BY rating DESC