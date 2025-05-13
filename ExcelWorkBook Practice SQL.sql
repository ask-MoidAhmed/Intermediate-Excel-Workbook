-- Customer Behavior & Segmentation --

# top 10 most valuable customers by lifetime spend
select o.CusId, c.FirstName, c.LastName, sum(o.total) as total
from orders as o
inner join customers as c
	on o.CusId=c.CusId
group by o.CusId, c.FirstName, c.LastName
order by total desc
limit 10
;

# average rating based on State and year
select avg(r.RateId) as AvgRate, sa.State
from reviews as r
inner join orders as o
	on r.OrderId=o.OrderId
inner join shipaddress as sa
	on o.CusId=sa.CusId
where o.OrderDate like '2024-%'
group by sa.State
order by AvgRate desc
;

# Top Purchases by Product
select od.ProductId, sum(od.TotalPrice) as TP
from inventory as i
inner join orderdetails as od
	on i.ProductId=od.ProductId
group by od.ProductId
order by TP desc
limit 5
;

# Top Purchases by Product Category
select i.Category, sum(od.TotalPrice) as Total 
from orderdetails as od
inner join inventory as i
	on od.ProductId=i.ProductId
group by i.Category
order by Total desc
limit 5
;

# which product categories receive the most negative/positive reviews?
select rw.RateId, i.Category
from reviews as rw
inner join orderdetails as od
	on rw.OrderId=od.OrderId
inner join inventory as i
	on od.ProductId = i.ProductId
where rw.RateId > 4
			   # ^ change the sign and the number to "> 4" or "< 2" 
group by i.Category, rw.RateId
;

# do customer returns relate to negative reviews?
select rv.OrderId, rt.ProductId, rv.RateId, rv.Review, rt.ReturnSt
from returns rt
inner join reviews as rv
	on rt.OrderId=rv.OrderId    # conclusion: there is no relation.
;

# lets find rate of orders per day and the average days per between order
with OrderDays as
(
select CusId, OrderDate, datediff(
OrderDate, lag(OrderDate) over (partition by CusId
								order by OrderDate)) as AvgDays
from orders)
select
avg(AvgDays) as AverageDaysbOrders,
1/avg(AvgDays) as OrdersPerDay
from OrderDays
where AvgDays is not null
;

-- Revenue and Performance --

# most/least bought product(s)
select i.ProductNm, count(od.ProductId) as TotalBought
from orderdetails as od
inner join inventory as i
	on od.ProductId=i.ProductId
group by i.ProductNm
	having TotalBought =(
		select max(Count)
			#   ^ change this to min or max
        from (
			select count(*) as Count
            from orderdetails as od
            group by od.ProductId) temp
            )
;

# most/least profitable product and most/least profit margin per product
select
i.ProductNm,
round((sum((i.Price - i.Cost)*od.Quantity)), 2) as Profit,
round(((sum((i.Price - i.Cost)*od.Quantity))/(sum((i.Price)*od.Quantity))*100),2) as ProfitMargin
from inventory as i
inner join orderdetails as od
	on i.ProductId=od.ProductId
group by i.ProductNm 
order by Profit desc # <---- Change this to "ProfitMargin" or "Profit"
limit 1
;

# total revenue per year
select round(sum(Total),2) TotalRevenue
from orders
where year(OrderDate) = 2024
;

#total revenue per year per state
select round(sum(o.Total),2) as TotalRevenue
from orders o
inner join shipaddress sa
	on o.CusId=sa.CusId
where year(o.OrderDate) = 2024
and sa.State = 'Arkansas'
;

# total profitability
select round(sum(o.Total-o.TaxFee-o.Shipfee)-sum(i.Cost),2) as TotalProfit, year(o.OrderDate) as Year
from orders o
inner join orderdetails od
	on o.OrderId=od.OrderId
    inner join inventory i
		on od.ProductId=i.ProductId
where year(o.OrderDate)= 2024
group by year(o.OrderDate)
;

# which 5 states generated the most/least profit total
select round(sum(o.Total),2) as TotalRevenue, sa.State
from orders o
inner join shipaddress sa
	on o.CusId=sa.CusId
group by sa.State
order by TotalRevenue desc #<---- remove the desc to make it the least revenue generating states
limit 5
;

# which month generated the most revenue for a specific year
select monthname(OrderDate) as MonthSel, round(sum(o.Total),2) as TotalRevenue
from orders o
where year(o.OrderDate)=2023 #<---- change the year
group by MonthSel
order by TotalRevenue desc
limit 1 #<---- change the limit to get more states
;

# lets also calculate roi
		# we need to minus costs from profit
select
round(((
(sum(o.Total-o.TaxFee-o.Shipfee)
-
sum(i.Cost))
/
((select sum(s.Salary)
from staff s) + sum(i.Cost))
)*100),2) as ROI,
year(o.OrderDate) as Year
from orders o
inner join orderdetails od
	on o.OrderId=od.OrderId
    inner join inventory i
		on od.ProductId=i.ProductId
where year(o.OrderDate)= 2024
group by year(o.OrderDate)
;

# lets calculte COGS by year
select
round(sum(i.Cost),2) as COGS,
year(o.OrderDate) as YearLook
from orders as o
inner join orderdetails as od
	on o.OrderId=od.OrderId
    inner join inventory as i
		on od.ProductId=i.ProductId
where year(o.OrderDate) = 2024
group by year(o.OrderDate)
;

# total shipping fees/tax revenue collected in a given year
select round(sum(ShipFee),2) as ShipFee, round(sum(TaxFee),2) as TaxFee, year(OrderDate) as YearGiven
from orders
where year(OrderDate)=2023
group by year(OrderDate)
;

# did we generate more profit or less profit in 2024 than in 2023
with RevenueData as (
select
round(sum(case when year(o.OrderDate) = 2024 then o.Total else 0 end)-
sum(case when year(o.OrderDate) = 2023 then o.Total else 0 end),2) as RevDiff
from orders o)
select RevDiff,
if(RevDiff < 0,'Loss','Gain') as ProfitOrLoss
from RevenueData
;

-- Inventory Performance --

# which product has the highest/lowest inventory price
select ProductNm, TotInvPrice
from inventory
order by TotInvPrice desc # remove the desc to make is ascending
limit 1
;

# which product has the highest cost
select ProductNm, round(Cost*Inv,2) as TotalCost
from inventory
order by TotalCost desc 
limit 1
;

# dead inventory or least sold product
with Temp as(
select ProductId, sum(Quantity) as Total
from orderdetails
group by ProductId
order by Total)
select *
from inventory i
right join Temp t
	on t.ProductId=i.ProductId
order by t.Total
limit 1
;

-- Staff & Department Analysis --

# which department costs the most
select sum(s.Salary) TotalCost, d.DepName
from staff as s
inner join department as d
	on s.DeptId=d.DeptId
group by s.DeptId, d.DepName
order by TotalCost desc
limit 1
;

# what is the staff demographics
select FirstName, LastName, Age
,case
	when Age>65 then 'Baby Boomer'
    when Age>40 then 'Gen X'
    when Age>30 then 'Millennials'
    when Age>20 then 'Gen Z'
    else 'Gen Alpha'
end as Generation
from staff
order by Age             # BTW you can also do promotions based on salary using this, the when would be salary, and then would be their promotion salary
;

# who makes the most
select *
from staff
order by Salary desc
limit 1
;

