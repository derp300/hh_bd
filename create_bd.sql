create table "users" (
	"id" serial not null,
	"email" text not null UNIQUE,
	"password" text not null,
	"reg_time" timestamp not null,
	"last_online" timestamp not null,
	primary key ("id")
) with (
	OIDS=FALSE
);

create table "vacancy" (
	"id" serial not null,
	"company" text not null,
	"position" text not null,
	"description" text not null,
	"salary_from" integer not null,
	"salary_to" integer not null,
	"req_experience" integer not null,
	"req_skills" text not null,
	"posting_time" timestamp not null,
	"closing_time" timestamp not null,
	primary key ("id")
) with (
	OIDS=FALSE
);

create table "resume" (
	"id" serial not null,
	"position" text not null,
	"name" text not null,
	"age" integer not null,
	"salary_from" integer not null,
	"salary_to" integer not null,
	"experience" integer not null,
	"skills" text not null,
	"usr_id" integer not null references "users"("id"),
	primary key ("id")
) with (
	OIDS=FALSE
);


create table "applications_and_invitations" (
	"id" serial not null,
	"id_resume" integer not null references "resume"("id"),
	"id_vacancy" integer not null references "vacancy"("id"),
	"is_invitation" boolean not null,
	primary key ("id")
) with (
	OIDS=FALSE
);

create table "messages" (
	"id" serial not null,
	"message" text not null,
	"id_app" integer not null references "applications_and_invitations"("id"),
	primary key ("id")
) with (
	OIDS=FALSE
);