use master
drop database SwimmingPool_945
--Создаем БД--
USE MASTER
CREATE DATABASE SwimmingPool_945                    --имя БД
 ON                                    --описание файла БД
(NAME='Swiming_Pool_945',                     --логическое имя файла БД
 FILENAME='H:\university\3 семестр\Базы Данных\КР\Итог\Swimming_Pool_945.mdf',      --физическое имя файла БД
 SIZE=2,                              --первоначальный размер в МБ
 MAXSIZE=10,                          --максимальный размер в МБ
 FILEGROWTH=2)                        --шаг для автоматического увеличения файла в МБ
LOG ON                                --описание файла БД
 (NAME='SP_945_Log',                      --логическое имя журнала транзакций
 FILENAME='H:\university\3 семестр\Базы Данных\КР\Итог\Swimming_Pool_945_Log.mdf',       --физическое имя файла БД
 SIZE=2,                              --первоначальный размер в МБ
 MAXSIZE=10,                          --максимальный размер в МБ
 FILEGROWTH=2)                         --шаг для автоматического увеличения файла в МБ
GO
--Создаем таблицу Тип Абонемента--
use SwimmingPool_945
CREATE TABLE [Тип Абонемента]
([Код абонемента] int identity (1,1) NOT NULL,
Название nvarchar(100) NOT NULL UNIQUE check (Название like ('[А-Я][а-я]%')),
Описание nvarchar(100) NOT NULL check (Описание like ('[А-Я][а-я]%')),
Стоимость smallmoney NOT NULL CHECK(Стоимость>0),
[Срок действия] date NOT NULL)
GO 
--Устанавливаем ограничение PK таблицы Тип абонемента--
ALTER TABLE [Тип Абонемента]
ADD CONSTRAINT PK_ТипАбонемента primary key ([Код абонемента])
GO
--Создаем таблицу Клиенты--
CREATE TABLE Клиенты
([Код клиента] int identity (1,1) NOT NULL,
ФИО nvarchar(100) NOT NULL check (ФИО like ('[А-Я][а-я]%')),
[Дата рождения] date check (year([Дата рождения])<2019) NOT NULL, 
Адрес nvarchar (100) ,
Телефон nvarchar (100) NOT NULL  check ([Телефон] like '+7 ([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'))
GO
--Устанавливаем ограничение РК таблицы Клиенты--
ALTER TABLE Клиенты
ADD CONSTRAINT PK_Клиенты primary key ([Код клиента])
go
--Создаем таблицу Договор--
CREATE TABLE Договор
([Номер договора] int IDENTITY (1,1) NOT NULL,
[Код клиента]int NOT NULL,
[Код абонемента] int NOT NULL,
[Дата и время покупки] datetime NOT NULL)
GO
--Устанавливаем ограничение РК таблицы Договор--
ALTER TABLE Договор
ADD CONSTRAINT PK_Договор primary key ([Номер договора])
go
--Устанавливаем ограничение FK таблицы договор--
ALTER TABLE Договор
add	CONSTRAINT ДОГОВОР_ТИПАБОНЕМЕНТА_FK
  FOREIGN KEY ([Код абонемента]) REFERENCES [Тип Абонемента]([Код абонемента])
  ON DELETE CASCADE
  ON UPDATE CASCADE
go
--Устанавливаем ограничение FK таблицы договор--
ALTER TABLE Договор
add  CONSTRAINT ДОГОВОР_КЛИЕНТЫ_FK
  FOREIGN KEY ([Код клиента]) REFERENCES [Клиенты]([Код клиента])
  ON DELETE CASCADE
  ON UPDATE CASCADE
go
--Создаем таблицу Тренировки--
CREATE TABLE Тренировки
([Код клиента]int NOT NULL,
[Дата и время] datetime NOT NULL,
Стоимость smallmoney NOT NULL Check(Стоимость>0),
[ФИО инструктора] nvarchar(100) NOT NULL)
go
--Устанавливаем ограничение PK таблицы Тренировки--
alter table Тренировки
add constraint PK_Тренировки
primary key ([Код клиента],[Дата и время])
go
--Устанавливаем ограничение FK таблицы Тренировки--
alter table Тренировки 
  add CONSTRAINT ТРЕНИРОВКИ_КЛИЕНТЫ_FK
  FOREIGN KEY ([Код клиента]) REFERENCES [Клиенты]([Код клиента])
  ON DELETE CASCADE
  ON UPDATE CASCADE
go
--Устанавливаем ограничение UNIQUE таблицы Тренировки--
alter table Тренировки 
  add CONSTRAINT ДАТА_ФИО_UNIQUE
  UNIQUE ([Дата и время], [ФИО инструктора])
GO