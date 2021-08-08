USE parkinson;
SELECT age FROM parkinson_udprs;
SELECT * FROM parkinson_udprs WHERE age > 60;
SELECT * FROM parkinson_udprs ORDER BY age DESC;
SELECT * FROM parkinson_udprs ORDER BY age DESC LIMIT 1;
SELECT * FROM parkinson_udprs;
SELECT avg(age) FROM parkinson_udprs;
-- AGRUPAR PRIMERO POR SUJETO DE PRUEBA Y DESPUES POR EDAD
SELECT subject,age AS cuenta FROM parkinson_udprs GROUP BY subject,age;
SELECT age, count(*) AS 'total por edad' FROM (SELECT subject,age FROM parkinson_udprs GROUP BY subject,age) AS subconsulta GROUP BY age ORDER BY age ASC;

-- POST WORK 3
SELECT id_parkinson_udprs_test, `Jitter(%)`, `Jitter(Abs)`, `Jitter:RAP`, `Jitter:PPQ5`, `Jitter:DDP` FROM parkinson_udprs;

CREATE VIEW jitter_view AS
(SELECT id_parkinson_udprs_test, `Jitter(%)`, `Jitter(Abs)`, `Jitter:RAP`, `Jitter:PPQ5`, `Jitter:DDP` 
FROM parkinson_udprs);

SELECT * FROM jitter_view;

CREATE VIEW shimmer_view AS
(SELECT id_parkinson_udprs_test, `Shimmer`, `Shimmer(dB)`, `Shimmer:APQ3`, `Shimmer:APQ5`, `Shimmer:APQ11`, `Shimmer:DDA`
FROM parkinson_udprs);
SELECT * FROM shimmer_view;

CREATE VIEW updrs AS
(SELECT id_parkinson_udprs_test, test_time, `motor_UPDRS`, `total_UPDRS`
FROM parkinson_udprs);
SELECT * FROM updrs;
