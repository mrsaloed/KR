use master
drop database SwimmingPool_945
--������� ��--
USE MASTER
CREATE DATABASE SwimmingPool_945                    --��� ��
 ON                                    --�������� ����� ��
(NAME='Swiming_Pool_945',                     --���������� ��� ����� ��
 FILENAME='H:\university\3 �������\���� ������\��\����\Swimming_Pool_945.mdf',      --���������� ��� ����� ��
 SIZE=2,                              --�������������� ������ � ��
 MAXSIZE=10,                          --������������ ������ � ��
 FILEGROWTH=2)                        --��� ��� ��������������� ���������� ����� � ��
LOG ON                                --�������� ����� ��
 (NAME='SP_945_Log',                      --���������� ��� ������� ����������
 FILENAME='H:\university\3 �������\���� ������\��\����\Swimming_Pool_945_Log.mdf',       --���������� ��� ����� ��
 SIZE=2,                              --�������������� ������ � ��
 MAXSIZE=10,                          --������������ ������ � ��
 FILEGROWTH=2)                         --��� ��� ��������������� ���������� ����� � ��
GO
--������� ������� ��� ����������--
use SwimmingPool_945
CREATE TABLE [��� ����������]
([��� ����������] int identity (1,1) NOT NULL,
�������� nvarchar(100) NOT NULL UNIQUE check (�������� like ('[�-�][�-�]%')),
�������� nvarchar(100) NOT NULL check (�������� like ('[�-�][�-�]%')),
��������� smallmoney NOT NULL CHECK(���������>0),
[���� ��������] date NOT NULL)
GO 
--������������� ����������� PK ������� ��� ����������--
ALTER TABLE [��� ����������]
ADD CONSTRAINT PK_������������� primary key ([��� ����������])
GO
--������� ������� �������--
CREATE TABLE �������
([��� �������] int identity (1,1) NOT NULL,
��� nvarchar(100) NOT NULL check (��� like ('[�-�][�-�]%')),
[���� ��������] date check (year([���� ��������])<2019) NOT NULL, 
����� nvarchar (100) ,
������� nvarchar (100) NOT NULL  check ([�������] like '+7 ([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'))
GO
--������������� ����������� �� ������� �������--
ALTER TABLE �������
ADD CONSTRAINT PK_������� primary key ([��� �������])
go
--������� ������� �������--
CREATE TABLE �������
([����� ��������] int IDENTITY (1,1) NOT NULL,
[��� �������]int NOT NULL,
[��� ����������] int NOT NULL,
[���� � ����� �������] datetime NOT NULL)
GO
--������������� ����������� �� ������� �������--
ALTER TABLE �������
ADD CONSTRAINT PK_������� primary key ([����� ��������])
go
--������������� ����������� FK ������� �������--
ALTER TABLE �������
add	CONSTRAINT �������_�������������_FK
  FOREIGN KEY ([��� ����������]) REFERENCES [��� ����������]([��� ����������])
  ON DELETE CASCADE
  ON UPDATE CASCADE
go
--������������� ����������� FK ������� �������--
ALTER TABLE �������
add  CONSTRAINT �������_�������_FK
  FOREIGN KEY ([��� �������]) REFERENCES [�������]([��� �������])
  ON DELETE CASCADE
  ON UPDATE CASCADE
go
--������� ������� ����������--
CREATE TABLE ����������
([��� �������]int NOT NULL,
[���� � �����] datetime NOT NULL,
��������� smallmoney NOT NULL Check(���������>0),
[��� �����������] nvarchar(100) NOT NULL)
go
--������������� ����������� PK ������� ����������--
alter table ����������
add constraint PK_����������
primary key ([��� �������],[���� � �����])
go
--������������� ����������� FK ������� ����������--
alter table ���������� 
  add CONSTRAINT ����������_�������_FK
  FOREIGN KEY ([��� �������]) REFERENCES [�������]([��� �������])
  ON DELETE CASCADE
  ON UPDATE CASCADE
go
--������������� ����������� UNIQUE ������� ����������--
alter table ���������� 
  add CONSTRAINT ����_���_UNIQUE
  UNIQUE ([���� � �����], [��� �����������])
GO