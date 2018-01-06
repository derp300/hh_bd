insert into users ("id", "email", "password", "reg_time", "last_online")
values (100, 'gb@example.com', '1234qwerty', '2000-10-05 00:00', '2010-10-05 00:00');


insert into resume ("id", "position", "name", "age", "salary_from", "salary_to",
	"experience", "skills", "usr_id") 
values (100, 'director', 'geib nuel', 55, 70000, 130000, 48, 'sdfsdfsdf', 100);


insert into vacancy ("id", "company", "position", "description", "salary_from", "salary_to",
	"req_experience", "req_skills", "posting_time", "closing_time")
values (100, 'valve', 'director', 'managment', 70000, 130000, 48, 'sdfsdfsdf', '2000-10-05 00:00', '2017-10-05 00:00');


insert into applications_and_invitations ("id", "id_resume", "id_vacancy", "is_invitation")
values (100, 100, 100, true);

insert into messages ("id", "message", "id_app")
values (100, 'qqqqqqq', 100);

