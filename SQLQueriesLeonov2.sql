use SwimmingPool
go
--=================================================================================================================================================================
--1 ??????? ? ??????? ????? ?? ???????:
--?????? ? ?????????????? ?????????? ?????????
--??????? ??? ?????????? ?? ???????????, ? ??????? >3
select *
from [??? ??????????]
where [??? ??????????]>3
--?????? ? ?????????????? ?????????? ?????????? AND, OR ? NOT
--??????? ??? ?????????? ?? ???????????, ? ??????? ??? ????? ???????
select *
from [??? ??????????]
where ???????? not like ('???????%')
--?????? ? ?????????????? ?????????? ?????????? ??????????
--??????? ??? ?????????? ? ????????, ? ????? ????????? 910 ??? ?? 920
select *
from ???????
where ??????? like ('%910%') or not ??????? like ('%920%')
--?????? ?? ????????????? ????????? ??? ?????????
--??????? ??? ???????????? ??????????
select [??? ??????????], ???????? AS [???????????? ??????????]
from [??? ??????????]
where ???????? like ('% ????????????')
--?????? ? ????????? ?? ?????????????? ?????????
--??????? ??? ?????????? ? ???????????, ?????????? 300
select *
from ??????????
where ????????? in (300)
--?????? ?? ?????????????? ????????? ????????
--??????? ???????? ???????????, ???? ??????? ? ????????? 500 ? 1000
select ????????
from [??? ??????????]
where ????????? between 500 and 1000
--?????? ? ????????? ?? ???????????? ???????
--??????? ???? ? ????? ?????????? ?????? ?.?.
select [??? ???????????], [???? ? ?????]
from ??????????
where [??? ???????????] like ('?????%')
--?????? ? ????????? ?? ?????????????? ???????
--??????? ??? ? ????? ???????, ? ???????? ?? ?????? ?????
select ???, ???????
from ???????
where ????? is null
--================================================================================================================================================================
--2 ??????? ?? ?????????-????????????? ??????????? ????????: 
-- ?????? ?? ??????????? ??????; 
--??????? ??? ???????? ? ???????? ?? ???????????
select distinct ???, ???????? as ?????????
from [??? ??????????] join ??????? on [??? ??????????].[??? ??????????]=???????.[??? ??????????] join ??????? on ???????.[??? ???????]=???????.[??? ???????]
-- ?????? ?? ??????????? ??????; 
--??????? ???? ????????, ? ??????? ???????????? ????????? ? ???? ???????????? ?????????? 
select [??? ???????]
from ??????????
intersect
select [??? ???????]
from ???????
where [??? ??????????] in (select [??? ??????????] from [??? ??????????] where ???????? like ('% ????????????'))
-- ?????? ?? ????????? ??????; 
--??????? ???? ????????, ? ??????? ??? ???????????? ??????????
select [??? ???????]
from ???????
except
select [??? ???????]
from ??????????
-- ?????? ? ?????????????? ??????????? ???????????? ??????; 
--????????? ???????????? ?????????? ? ????????
select *
from ?????????? cross join ???????
--=====================================================================================================================================================================
--3. ?????????????? ???????: 
-- ?????? ? ?????????????? ?????????? ???? ?????? ?? ????????? ? ???????? ??????;
--??????? ??? ????????, ??? ???????? ? ???? ? ????? ?? ??????????
select distinct ???, [??? ???????????], [???? ? ?????]
from ???????, ??????????
where ???????.[??? ???????]=??????????.[??? ???????]
-- ?????? ? ?????????????? ?????????? ???? ?????? ?? ????????? ? ???????? ??????; 
--??????? ??? ???????? ? ???????? ?? ???????????
select distinct ???, ????????
from ???????, ???????, [??? ??????????]
where ???????.[??? ???????]=???????.[??? ???????] and ???????.[??? ??????????]=[??? ??????????].[??? ??????????]
-- ?????? ? ?????????????? ?????????? ?? ??????? ????????; 
--??????? ??? ???????????, ??? ???????, ????? ????????, ???????? ??????????
select distinct [??? ???????????], ???, [????? ????????], ????????
from ??????????, ???????, ???????, [??? ??????????]
where ??????????.[??? ???????]=???????.[??? ???????] and ???????.[??? ???????]=???????.[??? ???????] and ???????.[??? ??????????]=[??? ??????????].[??? ??????????]
-- ?????? ? ?????????????? ?????? ???????? ??????????; 
--??????? ??? ???? ???????? ? ?? ????????, ???? ???????
select distinct ??? as ??????, [??? ???????????] as ??????
from ??????? left join ?????????? on ???????.[??? ???????]=??????????.[??? ???????]
-- ?????? ?? ????????????? ??????? ???????? ??????????; 
--??????? ??? ???? ???????? ? ?? ????????, ???? ???????
select distinct ??? as ??????, [??? ???????????] as ??????
from ?????????? right join ??????? on ???????.[??? ???????]=??????????.[??? ???????]
-- ?????? ? ?????????????? ??????? COUNT;
--??????? ??? ??????? ? ?????????? ??? ??????????
select ???, COUNT (??????????.[??? ???????]) as [???-?? ??????????]
from ???????, ??????????
where ???????.[??? ???????]=??????????.[??? ???????]
group by ???????.???
-- ?????? ? ?????????????? ??????? SUM; 
--??????? ??? ??????? ? ??????? ?? ???????? ?? ??????????
select ???, SUm (??????????.[?????????]) as [????????? ??????????]
from ???????, ??????????
where ???????.[??? ???????]=??????????.[??? ???????]
group by ???????.???
-- 3 ??????? ? ?????????????? ????????? ???????; 
--??????? ?????????????????? ???????? 
select *
from ???????
where Year([???? ????????]) > 2002
--??????? ?????? ?????????, ??????????? ? ??????
select [????? ????????]
from ???????
where Month( [???? ? ????? ???????])=1
--??????? ???? ????????? ???????? ? ????????
select DAY([???? ? ????? ???????]) as [???? ?????????? ????????]
from ???????
where [??? ???????]=(select ???????.[??? ???????] from ??????? Where ??? ='?????? ?????? ??????????')
-- ?????? ? ?????????????? ??????????? ?? ?????? ???????; 
--??????? ????????, ???-?? ????????
select [??? ???????????], COUNT ([??? ???????]) as [???-?? ????????]
from ??????????
group by [??? ???????????] 
-- ?????? ?? ????????????? ??????????? ?? ?????????? ????????;
--??????? ????????, ???-?? ???????? ? ??????? ??????????
select [??? ???????????], COUNT ([??? ???????]) as [???-?? ????????], SUM(?????????) as ?????????
from ??????????
group by [??? ???????????] 

select  [??? ???????????], ???, COUNT(*) as [???-?? ???????]
from ?????????? inner join ??????? on ??????????.[??? ???????]=???????.[??? ???????]
group by  [??? ???????????], ???
-- ?????? ? ?????????????? ??????? ?????? ????? HAVING; 
-- ??????? ????????, ??????? ????????? ?? ?????????? ?? ????? 500 
select ???????.???, SUM (??????????.?????????) As ?????????
from ???????, ??????????
where ???????.[??? ???????]=??????????.[??? ???????]
group by ???????.???
having SUM(??????????.?????????)>=500
-- ?????? ? ?????????????? ?????????? ?? ???????;
--??????? ??? ???????? ? ??????? ???????? ???????????? ?? ??????????
select ???????.???, SUM (??????????.?????????) As ?????????
from ???????, ??????????
where ???????.[??? ???????]=??????????.[??? ???????]
group by ???????.???
order by ????????? DESC
--==========================================================================================================================
--4. ??????? ?? ??????????? ??????: 
-- ?????? ?? ?????????? ????? ?????? ? ???????; 
--???????? ????? ?????????
insert into [??? ??????????] 
values
('??????? ????????', '???? ????????? ?????????', 150, '2020-12-31')
--?????? ?? ?????????? ????? ?????? ?? ??????????? ???????????? ???????;
--
insert into ???????
select [??? ???????], [??? ??????????]+1, [???? ? ????? ???????]
from ???????
where [????? ????????]=22
-- ?????? ?? ?????????? ???????????? ?????? ? ???????; 
--????????? ????????? ???? ???????????
update [??? ??????????]
set ????????? = ????????? + 100
-- ?????? ?? ?????????? ???????????? ?????? ?? ??????????? ?????????? ?? ????? WHERE;
--?????? 30% ?? ???????? ?????????
update [??? ??????????]
set ????????? = ????????? * 0.7
where [??? ??????????] = (select [??? ??????????]
						  From [??? ??????????]
						  where ????????='??????? ????????')
-- ?????? ?? ???????? ???????????? ??????; 
delete 
from [??? ??????????]
-- ?????? ?? ???????? ???????????? ?????? ?? ????? ??????? ?? ?????? ????????? ? ??? ??????. 
delete [??? ??????????]
from [??? ??????????] join ??????? on [??? ??????????].[??? ??????????]=???????.[??? ??????????]
where [??? ??????????].[??? ??????????]=???????.[??? ??????????]
-- ?????? ?? ???????? ???????????? ?????? ?? ??????????? ?????????? ?? ????? WHERE; 
--??????? ????????? ??????? ????????
delete 
from [??? ??????????]
where [??? ??????????]=(Select [??? ??????????]
						from [??? ??????????]
						Where ????????= '??????? ????????')
--========================================================================================================================================================================
--5. ?????????????? ??????? ? ?????????????? ???????????: 
-- 3 ??????? ? ?????????????? ???????? ?????????; 
--????? ???????? ??????
select *
from ???????
where [???? ????????] = (select MIN(([???? ????????]))
						from ???????)
--????? ??????? ??????
select *
from ???????
where [???? ????????] = (select MAX(([???? ????????]))
						from ???????)
--??????? ????????, ? ??????? ?????? ???? ????????
select distinct [??? ???????????] 
from ??????????
where ?????????>= (Select avg(?????????) as ?????? 
					from ?????????? )

-- ?????? ? ?????????????? ???????? ANY; 
--??????? ?????????? ? ????????, ? ??????? ???? ??????????
select *
from ???????
where [??? ???????] = any (select [??? ???????] from ??????????)

-- ?????? ? ?????????????? ???????? ALL; 
-- ??????? ?????????? ? ????????, ? ??????? ??? ???????????? ??????????
select *
from ???????
where [??? ???????] != all (select [??? ???????] from ??????????)
-- ?????? ? ?????????????? ???????? IN; 
--??????? ???????? ? ??????? ?????? ?????
select *
from ???????
where [??? ???????] in (select [??? ???????] from ?????????? where [??? ???????????] like ('?????%'))

-- ?????? ? ?????????????? ???????? EXISTS; 
-- ?????????? ????????, ? ??????? ???? ??????????
select *
from ???????
where Exists (select * from ?????????? where ???????.[??? ???????]=??????????.[??? ???????])

-- ?????? ? ?????????????? ???? ????????? ???? ? ????? ???????????; 
--??????????? ?????????? ????????? ? ???????
select ???
from ??????? 
where [??? ???????] = (select MIN(a) from
						(select count(*) as a, [??? ???????]
							from ???????
							group by [??? ???????]) as a)

-- ?????? ? ?????????????? ???? ????????? ???? ? ????? ???????????;
--
select  distinct [??? ???????????]
from ??????????
where [??? ???????]in(select [??? ???????]
					 from ???????
					 where [??? ???????]in(select [??? ???????]
										  from ???????
										  where [??? ??????????]in(select [??? ??????????]
																  from [??? ??????????]
																  where ????????='??????? ???????')))
--===========================================================================================================================================================================

--6. ??????? ?? ????????? ????????? ???????????? ???????: 
-- ?????? ?? ?????????? ?????? ??????? ? ???????; 
alter table ???????
add [?????????? ??????] int
-- ?????? ?? ?????????? ?????? ??????????? ? ???????; 
alter table ???????
add Constraint uniq_phone UNIQUE (???????)
-- ?????? ?? ???????? ?????? ??????? ? ???????;
alter table ???????
drop column [?????????? ??????]
-- ?????? ?? ???????? ?????? ??????????? ? ???????; 
alter table ???????
drop Constraint uniq_phone 
-- ?????? ?? ????????? ???? ?????? ? ???????; 
alter table [??? ??????????] drop constraint [CK__??? ?????__?????__25869641]
alter table [??? ??????????]
alter column ???????? text
-- ?????? ?? ?????????? ?????? ?????????? ????? ? ??????? ? ??????????? ??????????? ???????;  
alter table ??????????
add constraint PK_??????????
Primary key ([??? ???????],[???? ? ?????])
