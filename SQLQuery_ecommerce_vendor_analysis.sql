#1)Which regions have the highest customer churn rates?
select region,
count(customer_id) as total_customers,
sum(case when churn_status = 'churned' then 1 else 0 end) as churned_customers,
round(sum(case when churn_status = 'churned' then 1 else 0 end)*100.0/count(customer_id),2) as churn_rate_pct
from customers
group by region
order by churn_rate_pct desc;

#2)Which customers haven’t placed an order in the past 90 days?
WITH last_order AS (
    SELECT 
        o.customer_id,
        MAX(o.order_date) AS last_order_date
    FROM orders o
    GROUP BY o.customer_id
)
SELECT 
    c.customer_id,
    c.customer_name,
    c.region,
    DATEDIFF(DAY, l.last_order_date, GETDATE()) AS days_since_last_order
FROM customers c
LEFT JOIN last_order l ON c.customer_id = l.customer_id
WHERE DATEDIFF(DAY, l.last_order_date, GETDATE()) >= 90
   OR l.last_order_date IS NULL
ORDER BY days_since_last_order DESC;

#3)What percentage of customers made more than one purchase?
WITH order_counts AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS total_orders
    FROM orders
    GROUP BY customer_id
)
SELECT 
    COUNT(CASE WHEN total_orders > 1 THEN 1 END) * 100.0 / COUNT(customer_id) AS repeat_purchase_rate_percent
FROM order_counts;

#4)Which regions generate the highest average order value?
select region,
round(avg(order_amount),2) as average_order_value
from orders
group by region
order by average_order_value desc;

#5)Which vendors generate the highest revenue and maintain high customer ratings?
select v.vendor_name,
v.avg_rating,
count(o.order_id) as total_orders,
sum(o.order_amount) as total_revenue
from orders o
join vendors v
on o.vendor_id = v.vendor_id
group by v.vendor_name,v.avg_rating
order by total_revenue desc,v.avg_rating desc;

#6) Which product categories have the highest return/cancellation rate?
select product_category,
     count(order_id) as total_orders,
     sum(case when delivery_status in ('returned','cancelled') then 1 else 0 end) as problematic_orders,
     ROUND(
         sum(case when delivery_status in ('returned','cancelled') then 1 else 0 end)*100.0/count(order_id),2) as issue_rate_pct
from orders
group by product_category
order by issue_rate_pct desc;

#7) What is the average total revenue per customer?(CLV)

select c.customer_id,
c.customer_name,
sum(o.order_amount) as total_spent,
count(o.order_id) as total_orders
from customers c 
join orders o
on c.customer_id=o.customer_id
group by c.customer_id, c.customer_name
order by total_spent desc, total_orders desc;

#8)What percentage of total revenue does each vendor contribute?

select v.vendor_name,
       sum(o.order_amount) as vendor_revenue,
       round(sum(o.order_amount)*100.0/sum(sum(o.order_amount)) over (), 2) as revenue_share_percent
from orders o
join vendors v
on o.vendor_id = v.vendor_id
group by vendor_name
order by revenue_share_percent desc;

#9)What is the monthly revenue, total orders, and average order value trend over time?

select
    year(order_date) as order_year,
    month(order_date) as order_month,
    datename(month, order_date) as month_name,
    count(order_id) as total_orders,
    sum(order_amount) as total_revenue,
    round(avg(order_amount), 2) as avg_order_value
from orders
where order_date is not null
group by year(order_date), month(order_date), datename(month, order_date)
order by order_year, order_month;

#10)Which regions and product categories generate the highest revenue,
     #and how do they contribute to overall sales performance?
select
    region,
    product_category,
    count(order_id) as total_orders,
    sum(order_amount) as total_revenue,
    round(avg(order_amount), 2) as avg_order_value
from orders
where delivery_status = 'delivered'
group by region, product_category
order by total_revenue desc;