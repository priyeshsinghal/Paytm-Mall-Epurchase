use PaytmCompany;
SELECT * FROM [PaytmCompany].[dbo].[Paytm Epurchase data];
## to rename the table in SQL Server 

exec sp_rename '[PaytmCompany].[dbo].[Paytm Epurchase data]', 'Paytm';

select * from Paytm;

### What does the "Category_Grouped" column represent, and how many unique categories are there?

select distinct Category_Grouped from Paytm;

select S_no,Name,Category_Grouped,count(distinct Category_Grouped) as Unique_Categories from Paytm group by S_no, Name, Category_Grouped;

## Can you list the top 5 shipping cities in terms of the number of orders?

select top 5 Shipping_city, count(S_no) as OrderCount from Paytm group by Shipping_city order by OrderCount desc;

## Show me a table with all the data for products that belong to the "Others" Category_Grouped.

select * from Paytm where Category_Grouped = 'Others';

## Filter the data to show only rows with a "Sale_Flag" of 'On Sale'.

select * from Paytm where Sale_Flag= 'On Sale';

## Sort the data by "Item_Price" in descending order. What is the most expensive item?

select  top 1 Category,Brand,Item_Price from Paytm order by Item_Price desc;

## Ensure that the "Payment_Method" column only contains valid payment methods (e.g., COD,Prepaid).

update Paytm set Payment_Method = null where Payment_Method not in ('COD','Prepaid');

## Calculate the average "Quantity" sold for products in the "Men Footware','Women Apparel" category, grouped by "Product_Gender."

select Product_Gender, avg(convert(float,Quantity)) as AvgQuantity from Paytm  group by Product_Gender,Category having Category in ('Men Footwear','Women Apparel');

## Calculate the total "coupon_money_effective" and "Coupon_Percentage" for products in the "Electronics" category.

select * from Paytm;

select Category_Grouped,Category,sum (convert(float,coupon_money_effective)) as TotalCouponMoney, 
sum (convert(float,Coupon_Percentage)) as TotalCouponPercentage 
from Paytm where Category_Grouped = 'Others' 
group by Category_Grouped,Category;

## Identify products with a "paid_pr_effective" higher than the average in their respective "Family" and "Brand" groups.

select S_no,Name,Family,Brand,paid_pr_effective from Paytm
where paid_pr_effective > (select avg(paid_pr_effective) from Paytm);


