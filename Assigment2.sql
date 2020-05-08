drop table stadium
CREATE TABLE stadium
   ( id int  
   , event_name varchar(10), event_date int, people_count int 
   );

    Insert into stadium  
    select   1, 'event_1', replace('2017-01-01','-',''),10

Insert into stadium        
 select  2,'event_2',replace('2017-01-02','-',''),109

Insert into stadium select     
 3,'event_3',replace('2017-01-03','-',''),150

Insert into stadium select       
 4,'event_4',replace('2017-01-04','-',''),99

Insert into stadium select     
 5,'event_5',replace('2017-01-05','-',''),145

Insert into stadium select  
 6,'event_6',replace('2017-01-06','-',''),99

Insert into stadium 
select 7,'event_7',replace('2017-01-07','-',''),199

Insert into stadium 
select 8,'event_8',replace('2017-01-08','-',''),188

Insert into stadium 
select 9,'event_8',replace('2017-01-09','-',''),188


SELECT 
    b.id,b.event_name,b.event_date,b.people_count

FROM 
    (
        SELECT
            *
            ,COUNT(event_date) OVER (PARTITION BY sequential_group_num) AS num_days_in_sequence

        FROM 
            (
                SELECT
                    *
                    ,(id - ROW_NUMBER() OVER (ORDER BY event_date)) AS sequential_group_num

                FROM
                    stadium

                WHERE 
                    people_count >= 100

            ) AS a

    ) AS b

WHERE 
    num_days_in_sequence >= 3





