select * from world_layoff

-- 1.Remove duplicates
-- 2. Standardize The Data
-- 3. Null vaues or blank values
-- 4. Remove any column

create table layoffs_staging
(LIKE world_layoff);

select * from layoffs_staging -- we created another table because we may do mistakes while working with the raw data so we do not work on the raw data--, 

insert into layoffs_staging
select * 
from world_layoff;


select * from layoffs_staging

with duplicate_cte AS
(
select * ,
ROW_NUMBER() OVER(
	PARTITION BY company,industry,total_laid_off,percentage_laid_off,date_l) AS row_num
FROM layoffs_staging
)
select * 
from duplicate_cte
where row_num>1

select * from layoffs_staging
where company='Cazoo' -- this implies we need to make partition by each column--

with duplicate_cte AS
(
select * ,
ROW_NUMBER() OVER(
	PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,date_l,stage,country,fundraised)
	AS row_num
FROM layoffs_staging
)
select * 
from duplicate_cte
where row_num>1



select * from layoffs_staging
where company='Casper' -- we need to remove the 1 and 3 row since they are same--




'''
  with duplicate_cte AS
(
select * ,
ROW_NUMBER() OVER(
	PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,date_l,stage,country,fundraised)
	AS row_num
FROM layoffs_staging
)
delete
from duplicate_cte
where row_num>1
	'''  --- delete will not work  for CTE--

--go to tabl layoffs_staging right click select script then select create scripts
	--copy the query of table creation only--

	--we want to create a new column namely row_num--
CREATE TABLE IF NOT EXISTS public.layoffs_staging2
(
    company character varying COLLATE pg_catalog."default",
    location character varying COLLATE pg_catalog."default",
    industry character varying COLLATE pg_catalog."default",
    total_laid_off bigint,
    percentage_laid_off numeric,
    date_l date,
    stage character varying COLLATE pg_catalog."default",
    country character varying COLLATE pg_catalog."default",
    fundraised numeric,
	row_num int
)

select * from layoffs_staging2

insert into layoffs_staging2
select * ,
ROW_NUMBER() OVER(
	PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,date_l,stage,country,fundraised)
	AS row_num
FROM layoffs_staging;

--return the rows where numbr of rows ar more than 1 of same data-- 
select * from layoffs_staging2
where row_num>1;

--deleting the duplicates--
delete 
from layoffs_staging2
where row_num>1;


select * from layoffs_staging2

--2. Standardize The Data

select company,trim(company)
from layoffs_staging2;

update layoffs_staging2
set company=trim(company)

select *
from layoffs_staging2;

select industry
from layoffs_staging2;

select distinct industry
from layoffs_staging2
order by 1;

select *
from layoffs_staging2
where industry like 'Crypto%';


update layoffs_staging2
set industry='Crypto'
where industry like 'Crypto%';


select *
from layoffs_staging2
where industry like 'Crypto%';

select distinct industry
from layoffs_staging2;


select *
from layoffs_staging2;

select distinct location
from layoffs_staging2
	order by 1;

select distinct country
from layoffs_staging2
	order by 1;


select *
from layoffs_staging2
where country like 'United States%'
order by 1;


select distinct country, trim(trailing  '.' from country )
from layoffs_staging2
	order by 1;

update layoffs_staging2
set country=trim(trailing  '.' from country )
where country like 'United States%'

select distinct country
from layoffs_staging2;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'layoffs_staging2';


select *
from layoffs_staging2

-- 3. Null vaues or blank values

select *
from layoffs_staging2
WHERE total_laid_off is null and percentage_laid_off is null;

select *
from layoffs_staging2
WHERE industry is null or industry=''


select *
from layoffs_staging2
WHERE company='Airbnb'

select *
from layoffs_staging2 as t1
join layoffs_staging2 as t2
    on t1.company=t2.company
where (t1.industry is null or t1.industry ='') 
and t2.industry is not null;

select t1.industry,t2.industry
from layoffs_staging2 as t1
join layoffs_staging2 as t2
    on t1.company=t2.company
where (t1.industry is null or t1.industry ='') 
and t2.industry is not null;


update layoffs_staging2
set industry=null
where industry='';

select t1.industry,t2.industry
from layoffs_staging2 as t1
join layoffs_staging2 as t2
    on t1.company=t2.company
where (t1.industry is null or t1.industry ='') 
and t2.industry is not null;



'''update layoffs_staging as t1
join layoffs_staging as t2
   on t1.company=t2.company
set t1.industry=t2.industry
where t1.industry is null  
and t2.industry is not null;''' --update and join is not directly supported--

UPDATE layoffs_staging2 t1
SET industry = t2.industry
FROM layoffs_staging2 t2
WHERE t1.company = t2.company
  AND t1.industry IS NULL
  AND t2.industry IS NOT NULL;

select *
from layoffs_staging2
WHERE company='Airbnb'


select *
from layoffs_staging2
WHERE industry is null or industry=''


select *
from layoffs_staging2
WHERE company  like 'Bally%'

'''
update layoffs_staging2
set total_laid_off = 0    -- we can do that but its not good since we dont know the actual percentage of total laiyoffs--
where total_laid_off is null
'''	


select * 
from layoffs_staging2



-- 4. Remove any column we need to remove
select *
from layoffs_staging2
WHERE total_laid_off is null and percentage_laid_off is null;


delete 
from layoffs_staging2
WHERE total_laid_off is null and percentage_laid_off is null;

select *
from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;

select *
from layoffs_staging2;


---DATA CLEANING IS DONE---