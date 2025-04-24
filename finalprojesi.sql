CREATE TABLE Members(
	id int primary key generated always as identity,
	kullanıcı_adi varchar(50) unique not null,
	eposta varchar(100) unique not null,
	sifre varchar(255) not null,
	kayit_tarihi TIMESTAMP default current_timestamp,
	ad varchar(50) not null,
	soyad varchar(50) not null
);
CREATE TABLE Categories(
	id int primary key generated always as identity,
	kategori_adi varchar(100) unique not null
);
CREATE TABLE Courses(
	id int primary key generated always as identity,
	ad VARCHAR(200) not null,
	aciklama TEXT not null,
	baslangic_tarih DATE not null,
	bitis_tarih DATE not null,
	egitmen_bilgi varchar(100) not null,
	category_id int not null,
	FOREIGN KEY (category_id) REFERENCES Categories(id)
);

CREATE TABLE Enrollments(
	id int primary key generated always as identity,
	member_id int not null,
	course_id int not null,
	katilim_tarihi timestamp default current_timestamp,
	foreign key (member_id) references Members(id),
	foreign key (course_id) references Courses(id)
);
create table Certificates(
	id int primary key generated always as identity,
	sertifika_kodu varchar(100) unique not null, 
	verilis_tarihi date default current_date,
	member_id int not null,
	course_id int not null,
	foreign key (member_id) references Members(id),
	foreign key (course_id) references Courses(id)
);
create table CertificateAssignments(
	id int primary key generated always as identity,
	member_id int not null,
	certificate_kodu varchar(100) not null,
	alım_tarihi date default current_date,
	foreign key (member_id) references Members(id),
	foreign key (certificate_kodu) references Certificates(sertifika_kodu)
);

create table BlogPosts(
	id int primary key generated always as identity,
	baslik varchar(255) not null,
	icerik text not null,
	yayin_tarihi timestamp default current_timestamp,
	yazar_id int not null,
	foreign key (yazar_id) references Members(id)
);