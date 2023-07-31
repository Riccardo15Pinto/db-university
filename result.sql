
-- SELECT :

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT * 
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT * 
FROM `courses`
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT * 
FROM `students`
WHERE YEAR(`date_of_birth`) < 1993;

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)

SELECT * 
FROM `courses`
WHERE `period` = 'I semestre'
and `year` = 1;

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)

SELECT * 
FROM `exams`
WHERE HOUR(`hour`) >= 14 AND `date` like '%2020-06-20%';

-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT * 
FROM `degrees`
WHERE `name` LIKE 'corso di laurea magistrale%';

-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT * 
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT * 
FROM `teachers`
WHERE `phone` IS NULL;

-- GROUP BY

-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(*) as `number_new_student` , `enrolment_date` 
FROM `students`
GROUP BY `enrolment_date`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(*) as `same_teacher` , `office_address` as `office`
FROM `teachers`
GROUP BY `office`;

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT ROUND(avg(`vote`)), `exam_id` 
FROM `exam_student`;
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(*) `degree_course` , `department_id` as `department`
FROM `degrees`
GROUP BY `department`;

-- JOIN

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT D.`name`,S.`name` , S.`surname`
FROM `students` AS S
JOIN `degrees` AS D ON S.`degree_id` = D.`id`
WHERE D.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze



-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)



-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome


-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti


-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)


-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami