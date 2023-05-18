UPDATE salary # 테이블의 데이터를 변경
SET sex = CASE WHEN sex = 'f'  # SET '변경할 열' = '변경할 값'
            THEN 'm' 
        ELSE 'f' 
        END