create table ATC_STUDENTS(
    id integer primary key,
    name varchar2(255),
    surname varchar2(255),
    mark number(2,1),
    size_high_school varchar2(255)
);

create table ATC_COLLEGES(
    name varchar2(255) primary key,
    state varchar2(255),
    enrollment integer
);

create table ATC_APPLIES(
    sid integer,
    collage varchar2(255),
    major varchar2(255),
    decision integer,

    constraint pk_applies primary key (sid,collage,major),

    constraint fk_sid foreign key (sid) references ATC_STUDENTS(id),
    constraint fk_collage foreign key (collage) references ATC_COLLEGES(name)
);

