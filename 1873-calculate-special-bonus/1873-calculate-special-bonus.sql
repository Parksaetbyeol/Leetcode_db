# 각 직원의 보너스를 계산하는 SQL 쿼리를 작성하십시오. 직원의 상여금은 직원 ID가 홀수이고 직원 이름이 'M'으로 시작하지 않는 경우 급여의 100%입니다. 그렇지 않으면 직원의 보너스는 0입니다.
SELECT employee_id,
    IF(employee_id % 2 = 1 # id가 홀수
        AND name NOT REGEXP '^M', salary, 0) AS bonus # 이름이 'M'으로 시작하지 않음
FROM employees 
ORDER BY employee_id;