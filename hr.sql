-- employees 에서 전체 내용 조회
SELECT * 
FROM EMPLOYEES e ;

-- first_name, last_name, job_id 조회
SELECT first_name, last_name, job_id
FROM EMPLOYEES e ;

-- 사원번호가 176인 사람의 LAST_NAME 과 DEPARTMENT_ID 조회
SELECT LAST_NAME , DEPARTMENT_ID 
FROM EMPLOYEES e
WHERE employee_id = 176;

-- 연봉이 12000 이상 되는 직원들의 LAST_NAME 과 SALARY 조회
SELECT LAST_NAME , SALARY 
FROM EMPLOYEES e 
WHERE SALARY >=12000;

-- 연봉이 5000 에서 12000 의 번위 이외인 사람들의 LAST_NAME 과 SALARY 조회
SELECT LAST_NAME , SALARY 
FROM EMPLOYEES e 
WHERE SALARY < 5000 OR SALARY > 12000;

SELECT LAST_NAME , SALARY 
FROM EMPLOYEES e 
WHERE SALARY NOT BETWEEN 5000 and 12000;

-- 부서번호가 20, 50 부서에서 근무하는 사람들의 LAST_NAME, DEPARTMENT_ID 조회
SELECT LAST_NAME , DEPARTMENT_ID
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 50 ;

SELECT LAST_NAME , DEPARTMENT_ID
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN (20, 50) ;

-- LAST_NAME, DEPARTMENT_ID 오름차순
SELECT LAST_NAME , DEPARTMENT_ID
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN (20, 50) ORDER BY LAST_NAME ASC, DEPARTMENT_ID ASC ;

-- 커미션을 버는 모든 사원들의 LAST_NAME, SALARY, COMMISSION_PCT 조회
SELECT  LAST_NAME , SALARY , COMMISSION_PCT 
FROM EMPLOYEES e 
WHERE COMMISSION_PCT > 0 ORDER BY SALARY DESC, COMMISSION_PCT DESC;

-- SALARY 가 2500, 3500, 7000 이 아니며, SA_REP 나 ST_CLERK 사원 조회
SELECT *
FROM EMPLOYEES e 
WHERE SALARY != 2500 AND SALARY != 3500 AND SALARY <> 7000 AND (JOB_ID = 'SA_REP' OR JOB_ID = 'ST_CLERK') ;

SELECT *
FROM EMPLOYEES e 
WHERE SALARY NOT IN (2500, 3500, 7000) AND JOB_ID IN ('SA_REP', 'ST_CLERK') ; 

-- 2017-01-01 ~2017-12-31 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID, HIRE_DATE 조회
-- HIRE_DATE 내림차순 정렬
SELECT  LAST_NAME, EMPLOYEE_ID, HIRE_DATE
FROM  EMPLOYEES e 
WHERE HIRE_DATE >= '2017-01-01' AND HIRE_DATE <= '2017-12-31'
ORDER BY HIRE_DATE DESC;

SELECT  LAST_NAME, EMPLOYEE_ID, HIRE_DATE
FROM  EMPLOYEES e 
WHERE HIRE_DATE BETWEEN  '2017-01-01' AND '2017-12-31'
ORDER BY HIRE_DATE DESC;

-- 부서번호가 20, 50 부서에서 근무하고, 연봉이 5000~12000 사이인 사원들의 LAST_NAME, SALARY 조회
-- SALARY 오름차순

SELECT LAST_NAME, SALARY
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN (20, 50) AND SALARY BETWEEN 5000 AND 12000
ORDER BY SALARY ASC;

--LAST_NAME 에 u 가 포함되는 사원들의 사원번호, LAST_NAME 조회
SELECT EMPLOYEE_ID , LAST_NAME  
FROM EMPLOYEES e 
WHERE LAST_NAME LIKE  '%u%';

-- LAST_NAME 의 4번째 문자가 a 인 사원들의 사원번호, LAST_NAME 조회
SELECT EMPLOYEE_ID , LAST_NAME  
FROM EMPLOYEES e 
WHERE LAST_NAME LIKE  '---a%';

-- LAST_NAME 의  a 혹은 e 글자가 등어있는  사원들의 사원번호, LAST_NAME 조회후 LAST_NAME 오름차순 조회
SELECT EMPLOYEE_ID , LAST_NAME  
FROM EMPLOYEES e 
WHERE LAST_NAME LIKE  '%a%' OR LAST_NAME LIKE  '%e%'
ORDER BY LAST_NAME ASC;

-- LAST_NAME 에 a 와 e 글자가 들어있는 사원들의 사원번호, LAST_NAME 조회후 오름차순 조회
SELECT EMPLOYEE_ID , LAST_NAME  
FROM EMPLOYEES e 
WHERE LAST_NAME LIKE  '%a%e%' OR LAST_NAME LIKE  '%e%a%'
ORDER BY LAST_NAME ASC;

--
SELECT * FROM EMPLOYEES e ;

-- MANAGER_ID가 없는 사람들의 LAST_NAME, JOB_ID 조회
SELECT LAST_NAME , JOB_ID 
FROM EMPLOYEES e 
WHERE MANAGER_ID IS NULL ;

-- ST_CLERK 인 JOB_ID를 가진 사원이 없는 부서 ID 조회(단, 부서번호가 NULL 인 사원 제외)
SELECT DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE JOB_ID != 'ST_CLERK' AND DEPARTMENT_ID IS NOT NULL ;

SELECT DISTINCT  DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE JOB_ID NOT IN  ('ST_CLERK') AND DEPARTMENT_ID IS NOT NULL ;

SELECT DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE JOB_ID NOT IN  'ST_CLERK' AND DEPARTMENT_ID IS NOT NULL ;


-- COMMISSION_PCT 가 NULL 이 아닌 사원들 중에서 COMMISSION = SALARY * COMMISSION_PCT
-- 를 구하여 EMPLOYEE_ID, FIRST_NAME, JOB_ID, COMMISSION 룰 조회
SELECT EMPLOYEE_ID, FIRST_NAME , JOB_ID, SALARY, COMMISSION_PCT AS COMMISSION
FROM EMPLOYEES e ;

-- NULL * 숫자 = NULL
SELECT EMPLOYEE_ID, FIRST_NAME , JOB_ID, SALARY, COMMISSION_PCT AS COMMISSION
FROM EMPLOYEES e ;



-- FIRST_NAME 이 'Curtis' 인 사원의 FIRST_NAME, LAST_NAME, EMAIL, phon_number, job_id 를
-- 조회한다, 단 job_id 결과는 소문자로 출력한다
SELECT FIRST_NAME, LAST_NAME , EMAIL ,PHONE_NUMBER , LOWER(JOB_ID)
FROM EMPLOYEES e 
WHERE FIRST_NAME = 'Curtis' ;

-- 부서번호가 60, 70, 80, 90 인 사원들의 employee_id, first_name, hire_date, job_id 조회
-- 단, job_id가 IT_PROG 인 사원의 경우 프로그래머로 변경하여 출력한다.
SELECT EMPLOYEE_ID , FIRST_NAME, HIRE_DATE, REPLACE (JOB_ID, 'IT_PROG','프로그래머'), DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN (60,70,80,90);


-- JOB_ID 가 AD_PRES, PU_CLERK 인 사원들의 employee_id, first_name, job_id 조회
-- 단, 사원명은 FIRST_NAME 과 LAST_NAME 을 공백을 포함하여 연결
-- 'ABC' 'DEF' => 'ABC DEF'
SELECT EMPLOYEE_ID , FIRST_NAME || ' ' || LAST_NAME AS NAME, JOB_ID   
FROM EMPLOYEES e
WHERE JOB_ID IN ('AD_PRES', 'PU_CLERK');




--[실습4] 부서 80의 각 사원에 대해 적용가능한 세율을 표시하시오.
--DECODE, BETWEEN 사용 가능
SELECT
	LAST_NAME,
	SALARY,
	DEPARTMENT_ID,
	CASE TRUNC(SALARY/2000,0)
		WHEN 0 THEN '0%'
		WHEN 1 THEN '0.09'
		WHEN 2 THEN '0.2'
		WHEN 3 THEN '0.3'
		WHEN 4 THEN '0.4'
		WHEN 5 THEN '0.42'
		WHEN 6 THEN '0.44'
		ELSE '0.45'
		END AS TAX_RATE
	FROM
		EMPLOYEES e 
	WHERE DEPARTMENT_ID = 80;



-- 최대 연봉 - 최소연봉 차이 조회
SELECT MAX(SALARY) - MIN(SALARY) AS GAP
FROM EMPLOYEES e ;


-- 매니저로 근무하는 사원들의 총 수 조회(매니저 번호 중복 제거)
SELECT COUNT(DISTINCT MANAGER_ID) 
FROM EMPLOYEES e ;


-- 부서별 직원 수 구하기(부서번호의 오름차순 출력)
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES e
GROUP BY DEPARTMENT_ID  
ORDER BY DEPARTMENT_ID ;

-- 부서별 평균 급여(부서번호의 오름차순 출력)
SELECT DEPARTMENT_ID ,AVG(SALARY) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID ;

-- 동일한 직무를(JOB_ID) 가진 사원들의 총 수 조회
SELECT JOB_ID , COUNT(EMPLOYEE_ID) 
FROM EMPLOYEES e 
GROUP BY JOB_ID 
ORDER BY JOB_ID  ;



-- 매니저가 관리하는 사원들 중에서 최소급여 조회
-- 매니저가 관리하는 사원들 중에서 최소급여가 6000 미만인 최소급여는 제외
-- 매니저가 없는 사원 제외
SELECT MANAGER_ID ,MIN(SALARY)
FROM EMPLOYEES e
WHERE MANAGER_ID IS NOT  NULL
GROUP BY MANAGER_ID
HAVING MIN(SALARY) >= 6000
ORDER BY MANAGER_ID ;



-- 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기
-- HIRE_DATE, LAST_NAME, MANAGER_ID 출력 
SELECT
	e.EMPLOYEE_ID AS "내 사원번호",   -- AS 뒤에 띄워쓰기 하려면 "" 붙히기
	e.HIRE_DATE AS 내입사일,
	e.LAST_NAME AS 내이름,
	e.MANAGER_ID AS 매니저번호,
	e2.HIRE_DATE AS 매니저입사일
FROM
	EMPLOYEES e
JOIN EMPLOYEES e2 ON
	e.MANAGER_ID = e2.EMPLOYEE_ID AND e.HIRE_DATE < e2.HIRE_DATE ; 



-- 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, LAST_NAME, 부서번호 조회
-- (도시명은 Locations 테이블에 )
-- EMPLOYEES 의 DEPARTMENT_ID 와 DEPARTMENTS DEPARTMENT_ID 조인 후
-- DEPARTMENTS 테이블의 LOCATION_ID 와 LOCATIONS 테이블의 LOCATION_ID 조인
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME ,
	d.DEPARTMENT_ID ,
	l.CITY
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID         -- A테이블과 B 테이블의 공통 부분을 찾아서 조인
JOIN LOCATIONS l ON
	d.LOCATION_ID = l.LOCATION_ID
WHERE
	l.CITY LIKE 'T%';




-- 위치 아이디가 1700인 사원들의 LAST_NAME, 부서번호, 연봉 조회
SELECT
	e.EMPLOYEE_ID,
	e.LAST_NAME ,
	e.SALARY
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE
	d.LOCATION_ID = 1700;




-- 부서명, 위치ID, 각 부서별 사원 수, 각 부서별 평균 연봉 조회
-- 평균 연봉은 소수점 2자리까지만 표현
SELECT
	d.DEPARTMENT_NAME ,
	d.LOCATION_ID,
	COUNT(e.EMPLOYEE_ID),
	ROUND(AVG(e.SALARY), 2)
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY
	d.DEPARTMENT_NAME ,
	d.LOCATION_ID
ORDER BY
	d.LOCATION_ID ;




-- Executive 부서에 근무하는 사원들의 부서번호, LAST_NAME, JOB_ID 조회
SELECT
	d.DEPARTMENT_ID ,
	e.LAST_NAME ,
	e.JOB_ID
FROM
	EMPLOYEES e
JOIN DEPARTMENTS d ON
	e.DEPARTMENT_ID = d.DEPARTMENT_ID
	AND d.DEPARTMENT_NAME = 'Executive';



-- 각 사원별 소속 부서에서 자신보다 늦게 고용되었으나 많은 연봉을 받은 사원이 존재하는
-- 사원들의 이름 조회(이름은 FIRST_NAME 과 LAST_NAME 을 결합하여 하나로 나오게 하기)
-- 부서번호, 결합된 이름, SALARY, HIRE_DATE 출력 
SELECT
	DISTINCT e.DEPARTMENT_ID AS 부서번호,
	e.FIRST_NAME || ' ' || e.LAST_NAME AS "내이름",
	e.SALARY AS 내급여,
	e.HIRE_DATE AS 내입사일
FROM
	EMPLOYEES e
JOIN EMPLOYEES e2 ON
	e.DEPARTMENT_ID = e2.DEPARTMENT_ID
	AND e.SALARY < e2.SALARY AND e.HIRE_DATE < e2.HIRE_DATE ; 




-- LAST_NAME 에 u 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사원번호 및 LAST_NAME 조회
-- 사원번호는 오름차순 
SELECT
	e.EMPLOYEE_ID ,
	e.LAST_NAME
FROM
	EMPLOYEES e
WHERE
	e.DEPARTMENT_ID IN (
	SELECT
		DISTINCT DEPARTMENT_ID
	FROM
		EMPLOYEES e
	WHERE
		LAST_NAME LIKE '%u%')
		ORDER BY e.EMPLOYEE_ID ;
	
	
	
-- 기존의 직업을 여전히 가지고 있는 사원들의 사원번호 및 job_id 조회
-- employees, job_history 이용
SELECT e.EMPLOYEE_ID  , e.JOB_ID 
FROM EMPLOYEES e
WHERE (e.EMPLOYEE_ID, e.JOB_ID) IN (SELECT jh.employee_id, jh.job_id FROM JOB_HISTORY jh) ;




-- SELECT 서브쿼리 
-- 각 직무별 연봉 총합 및 각 부서별 연봉 총합 조회
-- JOB_ID, 부서별 연봉총합, 전체총합
SELECT JOB_ID, (SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=10 AND e.JOB_ID=e2.job_id) AS DEPT10,
(SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=20 AND e.JOB_ID=e2.job_id) AS DEPT20,
(SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=30 AND e.JOB_ID=e2.job_id) AS DEPT30,
(SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=40 AND e.JOB_ID=e2.job_id) AS DEPT40,
(SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=50 AND e.JOB_ID=e2.job_id) AS DEPT50,
(SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=60 AND e.JOB_ID=e2.job_id) AS DEPT60,
(SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=70 AND e.JOB_ID=e2.job_id) AS DEPT70,
(SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=80 AND e.JOB_ID=e2.job_id) AS DEPT80,
(SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=90 AND e.JOB_ID=e2.job_id) AS DEPT90,
(SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=100 AND e.JOB_ID=e2.job_id) AS DEPT100,
(SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE DEPARTMENT_ID=110 AND e.JOB_ID=e2.job_id) AS DEPT110,
(SELECT SUM(SALARY)  FROM EMPLOYEES e2 WHERE e.job_id =e2.job_id) AS TOTLA
FROM EMPLOYEES e 
GROUP BY JOB_ID 
ORDER BY JOB_ID ;




-- JOB_ID 가 SA_MAN 인 사원들의 최대 연봉보다 높게 받는 사원들의 LAST_NAME, JOB_ID, SALARY 조회 
SELECT
	LAST_NAME,
	JOB_ID,
	SALARY
FROM
	EMPLOYEES e
WHERE
	SALARY > (
	SELECT
		MAX(SALARY)
	FROM
		EMPLOYEES e
	WHERE
		JOB_ID = 'SA_MAN');

	
	
	
-- 커미션을 버는 사원들의 부서와 연봉이 동일한 사원들의 LAST_NAME, 부서번호, 연봉 조회 
SELECT
	LAST_NAME,
	DEPARTMENT_ID ,
	SALARY
FROM
	EMPLOYEES e
WHERE 
	(DEPARTMENT_ID ,
	SALARY) IN (
	SELECT                     -- 갯수 동일
		DEPARTMENT_ID ,
		SALARY
	FROM
		EMPLOYEES e
	WHERE
		COMMISSION_PCT IS NOT NULL) 
	
	
	
-- 회사 전체 평균 연봉보다 더 많이 버는 사원들 중 LAST_NAME에 u 가 있는 사원들이 근무하는 부서에서 근무하는 
-- 사원들의 사원번호, LAST_NAME, 부서번호, 연봉 조회
	SELECT
	EMPLOYEE_ID ,
	LAST_NAME ,
	DEPARTMENT_ID,
	SALARY
	FROM
	EMPLOYEES e
WHERE
	DEPARTMENT_ID IN (
	SELECT
		DISTINCT DEPARTMENT_ID
	FROM
		EMPLOYEES e
	WHERE
		SALARY > (
		SELECT
			AVG(e.SALARY)
		FROM
			EMPLOYEES e)
		AND LAST_NAME LIKE '%u%');
		
		
		
-- 각 부서별 평균 연봉보다 더 받은 동일 부서 근무사원들의 
-- LAST_NAME, 부서번호, 연봉 및 해당 부서의 평균 연봉 조회
-- 부서별 연봉을 기준으로 정렬 

	SELECT
	E1.LAST_NAME ,E1.DEPARTMENT_ID ,E1.SALARY ,E2.DEPT_SAL_AVG
FROM
    EMPLOYEES E1,
	(
	SELECT
		DEPARTMENT_ID ,
		AVG(SALARY) AS DEPT_SAL_AVG
	FROM
		EMPLOYEES e
	GROUP BY
		DEPARTMENT_ID) E2 
WHERE 	
	E1.DEPARTMENT_ID = E2.DEPARTMENT_ID AND E1.SALARY > E2.DEPT_SAL_AVG
	ORDER BY E1.DEPARTMENT_ID ;

	
	
	
-- LAST_NAME 이 Davies 인 사람보다 후에 고용된 사원들의  LAST_NAME, HIRE_DATE 조회

SELECT
	LAST_NAME ,
	HIRE_DATE
FROM
	EMPLOYEES e
WHERE
	HIRE_DATE > (
	SELECT
		HIRE_DATE
	FROM
		EMPLOYEES e
	WHERE
		LAST_NAME = 'Davies')




-- LAST_NAME 이 King 인 사원을 매니저로 두고 있는 모든 사원들의 LAST_NAME, SALARY 조회
		
SELECT
	LAST_NAME ,
	SALARY
FROM
	EMPLOYEES e
WHERE
	MANAGER_ID IN (
	SELECT
		EMPLOYEE_ID
	FROM
		EMPLOYEES e
	WHERE
		LAST_NAME = 'King');
		
		

-- LAST_NAME 이 Kochher 인 사원과 동인한 연봉 및 커미션을 버는 사원들의 LAST_NAME, 부서번호, SALARY 조회
-- Kochher 은 제외한다
	SELECT
	LAST_NAME ,
	DEPARTMENT_ID ,
	SALARY
FROM
	EMPLOYEES e
WHERE
	(SALARY ,
	NVL(COMMISSION_PCT, 0)) IN (
	SELECT
		SALARY ,
		NVL(COMMISSION_PCT, 0)
	FROM
		EMPLOYEES e
	WHERE
		LAST_NAME = 'Kochher')
	AND E.LAST_NAME != 'Kochher';
		
		
-- 부서가 위치한 국가 ID, 국가 이름 조회
-- countries 테이블과 locations, departments 이용
SELECT
	COUNTRY_ID ,
	COUNTRY_NAME
FROM
	COUNTRIES c
WHERE
	COUNTRY_ID IN (
	SELECT
		L.COUNTRY_ID
	FROM
		LOCATIONS l ,
		(
		SELECT
			LOCATION_ID
		FROM
			DEPARTMENTS d ) D
	WHERE
		L.LOCATION_ID = D.LOCATION_ID )
		
		
-- 총 사원 수 및 2013, 2014, 2015, 2016 년도 별 고용된 사원들의 총 수를 조회한다
--SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES  WHERE TO_CHAR(HIRE_DATE,'yy') = '13'; -- 4자리면 'yyyy' = 2013 , 2자리면 'yy' = '13'
--SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES  WHERE HIRE_DATE LIKE '13%'; -- LIKE 도 사용가능
SELECT
	DISTINCT 
(
	SELECT
		count(employee_id)
	FROM
		EMPLOYEES e2) AS "총 사원수",
	(
	SELECT
		COUNT(employee_id)
	FROM
		EMPLOYEES e
	WHERE
		TO_CHAR(HIRE_DATE, 'yy') = '13') AS "2013",
	(
	SELECT
		COUNT(employee_id)
	FROM
		EMPLOYEES e
	WHERE
		TO_CHAR(HIRE_DATE, 'yy') = '14') AS "2014",
	(
	SELECT
		COUNT(employee_id)
	FROM
		EMPLOYEES e
	WHERE
		TO_CHAR(HIRE_DATE, 'yy') = '15') AS "2015",
	(
	SELECT
		COUNT(employee_id)
	FROM
		EMPLOYEES e
	WHERE
		TO_CHAR(HIRE_DATE, 'yy') = '16') AS "2016"
FROM
	EMPLOYEES e 
		
		
		
		
		
-- 위치 ID 가 1700인 사원들의 연봉과 커미션을 추출한 뒤, 추출된 사원들의 연봉과 커미션이 동일한 사원정보 조회
-- 사원번호, 이름(FIRST + LASt 결합), 부서번호, 급여 출력

 
 SELECT
	EMPLOYEE_ID ,
	FIRST_NAME || ' ' || LAST_NAME AS NAME,
	DEPARTMENT_ID ,
	SALARY
FROM
	EMPLOYEES e
WHERE
	(SALARY ,
	NVL( COMMISSION_PCT, 0) ) IN (
	SELECT
		SALARY ,
		NVL( COMMISSION_PCT, 0)
	FROM
		EMPLOYEES e
	WHERE
		DEPARTMENT_ID IN(
		SELECT
			DEPARTMENT_ID
		FROM
			DEPARTMENTS d
		WHERE
			d.LOCATION_ID = 1700))
			
			
			
			
			
			
			
			
			
-- full scan		
SELECT * FROM EMPLOYEES e WHERE FIRST_NAME = 'Jack';


-- 테이블 생성 - 구조, 데이터 복사
CREATE TABLE idx_employees AS SELECT DISTINCT first_name, last_name, hire_date FROM EMPLOYEES e ;


-- index 생성
CREATE INDEX idx_name ON idx_employees(FIRST_name);

-- index 사용해서 조회 => range scan
SELECT * FROM idx_employees WHERE FIRST_NAME = 'Jack';








 
 
 
 
 
 
 
 
 
 
