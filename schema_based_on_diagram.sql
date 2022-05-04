CREATE DATABASE hospital;

CREATE TABLE patient(
    id serial primary key,
    name varchar(50) not null,
    date_of_birth date not null,
    );

CREATE TABLE invoices(
    id int primary key,
    total_amount decimal not null,
    generated_at timestamp not null,
    payed_at timestamp not null,
    medical_history_id integer not null,

    foreign key(patient_id) references patient(id),
    foreign key(doctor_id) references doctor(id)
    );

CREATE TABLE medical_histories(
    id int primary key,
    admitted_at timestamp not null,
    patient_id int not null,
    status varchar(50) not null,
    );

CREATE TABLE invoice_items(
    id int primary key,
    unit_price decimal not null,
    quantity int not null,
    total_price decimal not null,
    invoice_id int not null,
    treatment_id int not null,
    
    foreign key(invoice_id) references invoices(id)
    );

CREATE TABLE treatments(
    id int primary key,
    type varchar(50) not null,
    name varchar(50) not null,
    );