--select * from user_gameplay 
--select * from deposit_gameplay
--select * from withdraw_gameplay
--
--alter table deposit_gameplay 
--alter column 'Datetime' Type varchar(400);
--
--ALTER TABLE withdraw_gameplay 
--ALTER COLUMN "Datetime" TYPE Timestamp USING "Datetime"::timestamp without time zone;
--

--select count(*) from deposit_gameplay dg; 
--
--select "USER ID" ,sum(amount) asd  from withdraw_gameplay  where "Datetime" between '02-10-2022 00:00' and '02-10-2022 12:00'
--group by "USER ID"
--select * from deposit_gameplay  wg where "USER ID" =566;

  --2nd october s1


with user_temp as (
select "USER ID" ,sum("Games Played") as no_of_gamesplayed from user_gameplay  where "Datetime" between '02-10-2022 00:00' and '02-10-2022 12:00' 
group by "USER ID" ),
deposit_temp as (
select "USER ID" ,sum(amount) as deposit_amount from deposit_gameplay  where "Datetime" between '02-10-2022 00:00' and '02-10-2022 12:00'
group by "USER ID"),
withdraw_temp as (
select "USER ID" ,sum(amount) as withdraw_amount from withdraw_gameplay  where "Datetime" between '02-10-2022 00:00' and '02-10-2022 12:00'
group by "USER ID"),

aggreate_all as(
select ut."USER ID",no_of_gamesplayed,deposit_amount,withdraw_amount
FROM user_temp ut
left JOIN withdraw_temp ON ut."USER ID"=withdraw_temp."USER ID"
left join deposit_temp on ut."USER ID"=deposit_temp."USER ID"),

final_all as (
select *, 
( case when deposit_amount is null then 0 else 0.01*deposit_amount end)+
( case when withdraw_amount is null then 0 else 0.005*withdraw_amount end)+
( case when no_of_gamesplayed is null then 0 else  0.2*no_of_gamesplayed end )+
(case when deposit_amount-withdraw_amount>0 then 0.001*(deposit_amount-withdraw_amount) else 0  end) as  point

 from aggreate_all order by "USER ID" desc)
 
 select * ,ROW_NUMBER () OVER (ORDER BY point desc) from final_all limit 50
 
 
   --16th october s2
 with user_temp as (
select "USER ID" ,sum("Games Played") as no_of_gamesplayed from user_gameplay  where "Datetime" between '16-10-2022 12:00' and '16-10-2022 23:59' 
group by "USER ID" ),
deposit_temp as (
select "USER ID" ,sum(amount) as deposit_amount from deposit_gameplay  where "Datetime" between '16-10-2022 12:00' and '16-10-2022 23:59'
group by "USER ID"),
withdraw_temp as (
select "USER ID" ,sum(amount) as withdraw_amount from withdraw_gameplay  where "Datetime" between '16-10-2022 12:00' and '16-10-2022 23:59'
group by "USER ID"),

aggreate_all as(
select ut."USER ID",no_of_gamesplayed,deposit_amount,withdraw_amount
FROM user_temp ut
left JOIN withdraw_temp ON ut."USER ID"=withdraw_temp."USER ID"
left join deposit_temp on ut."USER ID"=deposit_temp."USER ID"),

final_all as (
select *, 
( case when deposit_amount is null then 0 else 0.01*deposit_amount end)+
( case when withdraw_amount is null then 0 else 0.005*withdraw_amount end)+
( case when no_of_gamesplayed is null then 0 else  0.2*no_of_gamesplayed end )+
(case when deposit_amount-withdraw_amount>0 then 0.001*(deposit_amount-withdraw_amount) else 0  end) as  point

 from aggreate_all order by "USER ID" desc)
 
 select * ,ROW_NUMBER () OVER (ORDER BY point desc) from final_all limit 50
 
    --18th october s1
 with user_temp as (
select "USER ID" ,sum("Games Played") as no_of_gamesplayed from user_gameplay  where "Datetime" between '18-10-2022 00:00' and '18-10-2022 12:00' 
group by "USER ID" ),
deposit_temp as (
select "USER ID" ,sum(amount) as deposit_amount from deposit_gameplay  where "Datetime" between '18-10-2022 00:00' and '18-10-2022 12:00'
group by "USER ID"),
withdraw_temp as (
select "USER ID" ,sum(amount) as withdraw_amount from withdraw_gameplay  where "Datetime" between '18-10-2022 00:00' and '18-10-2022 12:00'
group by "USER ID"),

aggreate_all as(
select ut."USER ID",no_of_gamesplayed,deposit_amount,withdraw_amount
FROM user_temp ut
left JOIN withdraw_temp ON ut."USER ID"=withdraw_temp."USER ID"
left join deposit_temp on ut."USER ID"=deposit_temp."USER ID"),

final_all as (
select *, 
( case when deposit_amount is null then 0 else 0.01*deposit_amount end)+
( case when withdraw_amount is null then 0 else 0.005*withdraw_amount end)+
( case when no_of_gamesplayed is null then 0 else  0.2*no_of_gamesplayed end )+
(case when deposit_amount-withdraw_amount>0 then 0.001*(deposit_amount-withdraw_amount) else 0  end) as  point

 from aggreate_all order by "USER ID" desc)
 
 select * ,ROW_NUMBER () OVER (ORDER BY point desc) from final_all limit 50


  --26th october s2
 with user_temp as (
select "USER ID" ,sum("Games Played") as no_of_gamesplayed from user_gameplay  where "Datetime" between '26-10-2022 12:00' and '26-10-2022 23:59' 
group by "USER ID" ),
deposit_temp as (
select "USER ID" ,sum(amount) as deposit_amount from deposit_gameplay  where "Datetime" between '26-10-2022 12:00' and '26-10-2022 23:59'
group by "USER ID"),
withdraw_temp as (
select "USER ID" ,sum(amount) as withdraw_amount from withdraw_gameplay  where "Datetime" between '26-10-2022 12:00' and '26-10-2022 23:59'
group by "USER ID"),

aggreate_all as(
select ut."USER ID",no_of_gamesplayed,deposit_amount,withdraw_amount
FROM user_temp ut
left JOIN withdraw_temp ON ut."USER ID"=withdraw_temp."USER ID"
left join deposit_temp on ut."USER ID"=deposit_temp."USER ID"),

final_all as (
select *, 
( case when deposit_amount is null then 0 else 0.01*deposit_amount end)+
( case when withdraw_amount is null then 0 else 0.005*withdraw_amount end)+
( case when no_of_gamesplayed is null then 0 else  0.2*no_of_gamesplayed end )+
(case when deposit_amount-withdraw_amount>0 then 0.001*(deposit_amount-withdraw_amount) else 0  end) as  point

 from aggreate_all order by "USER ID" desc)
 
 select * ,ROW_NUMBER () OVER (ORDER BY point desc) from final_all limit 50
 
 --october
 with user_temp as (
select "USER ID" ,sum("Games Played") as no_of_gamesplayed from user_gameplay  where "Datetime" between '1-10-2022 00:00' and '30-10-2022 23:59' 
group by "USER ID" ),
deposit_temp as (
select "USER ID" ,sum(amount) as deposit_amount from deposit_gameplay  where "Datetime" between '1-10-2022 00:00' and '30-10-2022 23:59'
group by "USER ID"),
withdraw_temp as (
select "USER ID" ,sum(amount) as withdraw_amount from withdraw_gameplay  where "Datetime" between '1-10-2022 00:00' and '30-10-2022 23:59'
group by "USER ID"),

aggreate_all as(
select ut."USER ID",no_of_gamesplayed,deposit_amount,withdraw_amount
FROM user_temp ut
left JOIN withdraw_temp ON ut."USER ID"=withdraw_temp."USER ID"
left join deposit_temp on ut."USER ID"=deposit_temp."USER ID"),

final_all as (
select *, 
( case when deposit_amount is null then 0 else 0.01*deposit_amount end)+
( case when withdraw_amount is null then 0 else 0.005*withdraw_amount end)+
( case when no_of_gamesplayed is null then 0 else  0.2*no_of_gamesplayed end )+
(case when deposit_amount-withdraw_amount>0 then 0.001*(deposit_amount-withdraw_amount) else 0  end) as  point

 from aggreate_all order by "USER ID" desc),
 
top_50 as (
select * ,row_number () OVER (ORDER BY point desc) as rk from final_all limit 50)
select * from top_50