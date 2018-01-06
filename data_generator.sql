insert into users ("email", "password", "reg_time", "last_online")
select
	substring(md5(random()::text) from 1 for 12) "email",
	substring(md5(random()::text) from 1 for 12) "password",
	timestamp '2000-10-05 00:00' + random()*(now() - timestamp '2000-10-05 00:00') "reg_time",
	timestamp '2000-10-05 00:00' + random()*(now() - timestamp '2000-10-05 00:00') "last_online"
from generate_series(1,1000);


insert into resume ("position", "name", "age", "salary_from", "salary_to", "experience", "skills", "usr_id")
select
	substring(md5(random()::text) from 1 for 12) "position",
	substring(md5(random()::text) from 1 for 12) "name",
	trunc(random()*100) "age",
	trunc(random()*10000) "salary_from",
	trunc(random()*10000) "salary_to",
	trunc(random()*500) "experience",
	substring(md5(random()::text) from 1 for 12) "skills",
	users.id "usr_id"
from generate_series(1,1000000)
join users on 1 > random()*(select count(*) from users);


insert into vacancy ("company", "position", "description", "salary_from", "salary_to",
	 "req_experience", "req_skills", "posting_time", "closing_time")
select
	substring(md5(random()::text) from 1 for 12) "company",
	substring(md5(random()::text) from 1 for 12) "position",
	substring(md5(random()::text) from 1 for 12) "description",
	trunc(random()*10000) "salary_from",
	trunc(random()*10000) "salary_to",
	trunc(random()*500) "req_experience",
	substring(md5(random()::text) from 1 for 12) "req_skills",
	timestamp '2000-10-05 00:00' + random()*(now() - timestamp '2000-10-05 00:00') "posting_time",
	timestamp '2000-10-05 00:00' + random()*(now() - timestamp '2000-10-05 00:00') "closing_time"
from generate_series(1,1000000);


insert into applications_and_invetations ("id_resume", "id_vacancy", "is_invitation")
select
	resume.id "id_resume",
	vacancy.id "id_vacancy",
	random()>0.5 "is_invitation"
from generate_series(1,500000)
join resume on 1 > random()*(select count(*) from resume)
join vacancy on 1 > random()*(select count(*) from vacancy);
		
insert into messages ("message", "id_app")
select
	substring(md5(random()::text) from 1 for 12) "message",
	applications_and_invetations.id "id_app"
from generate_series(1,1000000)
join applications_and_invetations on 1 > random()*(select count(*) from applications_and_invetations);