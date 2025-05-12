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