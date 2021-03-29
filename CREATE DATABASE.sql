use master
drop database SwimmingPool
--
USE MASTER
CREATE DATABASE SwimmingPool                    --��� ��
 ON                                    --�������� ����� ��
 (NAME='Swiming_Pool',                     --���������� ��� ����� ��
  FILENAME='H:\university\3 �������\���� ������\��\Swimming_Pool.mdf',      --���������� ��� ����� ��
  SIZE=2,                              --�������������� ������ � ��
  MAXSIZE=10,                          --������������ ������ � ��
  FILEGROWTH=2)                        --��� ��� ��������������� ���������� ����� � ��
 LOG ON                                --�������� ����� ��
 (NAME='SP_Log',                      --���������� ��� ������� ����������
  FILENAME='H:\university\3 �������\���� ������\��\Swimming_Pool_Log.mdf',       --���������� ��� ����� ��
  SIZE=2,                              --�������������� ������ � ��
  MAXSIZE=10,                          --������������ ������ � ��
  FILEGROWTH=2)                         --��� ��� ��������������� ���������� ����� � ��
 GO
 --
 use SwimmingPool
  CREATE TABLE [��� ����������]
  ([��� ����������] int identity (1,1) NOT NULL,
  �������� nvarchar(100) UNIQUE check (�������� like ('[�-�][�-�]%')),
  �������� nvarchar(100) check (�������� like ('[�-�][�-�]%')),
  ��������� smallmoney NOT NULL CHECK(���������>0),
  [���� ��������] date NOT NULL)
GO 
--
ALTER TABLE [��� ����������]
ADD CONSTRAINT PK_������������� primary key ([��� ����������])
go


--
  use SwimmingPool
   CREATE TABLE �������
  ([��� �������] int identity (1,1) NOT NULL,
  ��� nvarchar(100) NOT NULL check (��� like ('[�-�][�-�]%')),
  [���� ��������] date check (year([���� ��������])<2019) NOT NULL, 
  ����� nvarchar (100) ,
  ������� nvarchar (100) NOT NULL  check ([�������] like '+7 ([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'))
  GO
  --
  ALTER TABLE �������
ADD CONSTRAINT PK_������� primary key ([��� �������])
go
--
   use SwimmingPool
   CREATE TABLE �������
  ([����� ��������] int IDENTITY (1,1) NOT NULL,
  [��� �������]int NOT NULL,
  [��� ����������] int NOT NULL,
  [���� � ����� �������] datetime NOT NULL)
  GO
  --
  ALTER TABLE �������
ADD CONSTRAINT PK_������� primary key ([����� ��������])
go
--

ALTER TABLE �������
add	CONSTRAINT �������_�������������_FK
  FOREIGN KEY ([��� ����������]) REFERENCES [��� ����������]([��� ����������])
  ON DELETE CASCADE
  ON UPDATE CASCADE
  go
  --
ALTER TABLE �������
add  CONSTRAINT �������_�������_FK
  FOREIGN KEY ([��� �������]) REFERENCES [�������]([��� �������])
  ON DELETE CASCADE
  ON UPDATE CASCADE
go
--
   use SwimmingPool
  CREATE TABLE ����������
  ([��� �������]int NOT NULL,
  [���� � �����] datetime NOT NULL,
  ��������� smallmoney NOT NULL Check(���������>0),
  [��� �����������] nvarchar(100) NOT NULL)
  go
  --
  alter table ���������� 
  add CONSTRAINT ����������_�������_FK
  FOREIGN KEY ([��� �������]) REFERENCES [�������]([��� �������])
  ON DELETE CASCADE
  ON UPDATE CASCADE
  go
  --
  alter table ���������� 
  add CONSTRAINT ����_���_UNIQUE
  UNIQUE ([���� � �����], [��� �����������])
  GO
  --
  