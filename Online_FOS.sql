-- 3. Write a query to select all menu items where the price is less than $20.

select * from MenuItems
where Price < 20;


-- 4. Write a query to select all orders where the total amount is between $500 and $1000 and the order date is in 2023.
select * from orders
where TotalAmount between 500 and 1000 and OrderDate like '2023%';


-- 5. Write a query to select all restaurants where the cuisine type contains 'Italian'.
select * from restaurants
where CuisineType Like 'Italian';


-- 6. Write a query to select item names and calculate a discounted price if the original price is greater than $15.
select RestaurantID, ItemName, Price, Price*0.9 as DiscountedPrice from menuitems
where price > 15;


-- 7. Write a query to find all customers who have placed orders totaling more than $1000.
select * from customers inner join orders
on customers.CustomerID = orders.CustomerID
where TotalAmount > 1000;


-- 8. Write a query to get the total number of orders placed at each restaurant.
select RestaurantName, OrderID, count(OrderID) as TotalOrders from orders inner join restaurants
on orders.restaurantID = restaurants.restaurantID
group by OrderID;


-- 9. Write a query to get the total amount of orders for each restaurant, including only those with totals greater than $500.
select RestaurantName, TotalAmount, count(OrderID) as TotalOrders from orders inner join restaurants
on orders.restaurantID = restaurants.restaurantID
group by OrderID
having TotalAmount > 500;


-- 10. Write a query to select the top 5 highest-rated restaurants.
select * from reviews
order by Rating DESC limit 5;


-- 11. Write a query to join orders with customers to get a list of all orders with customer names, order dates, and total amounts.
select concat(FirstName, " ", LastName) as Name, OrderID, OrderDate, TotalAmount  from customers inner join orders
on customers.CustomerID = orders.CustomerID;


-- 12. Write a query to get a list of all menu items and any associated order details, including items that might not have been ordered.
select ItemName, MenuItems.MenuItemID, OrderDetailID, OrderID, Quantity, ItemPrice
from MenuItems LEFT OUTER JOIN OrderDetails
on MenuItems.MenuItemID = OrderDetails.MenuItemID;


-- 13. Write a query to get the total number of menu items available in each restaurant.
select RestaurantName, count(MenuItemID) from MenuItems inner join restaurants
on Menuitems.RestaurantID = Restaurants.RestaurantID
group by MenuItems.RestaurantID;


-- 14. Write a query to find all restaurants that have a rating of more than 4.0 from at least 3 different customers.
select RestaurantName, concat(FirstName, " ", LastName) as Name, reviews.customerID, Rating, ReviewDate, Comments
from reviews
inner join customers
on reviews.customerID = customers.customerID
inner join restaurants
on reviews.restaurantID = restaurants.restaurantID
where Rating > 4 and reviews.customerID in (select distinct CustomerID from reviews);

select distinct CustomerID from reviews;

-- 15. Write a query to list item names, restaurant names, quantities, and item prices for all ordered items.
select RestaurantName, OrderDetailID, Menuitems.MenuItemID, ItemName, CuisineType, Price, Quantity
from MenuItems inner join OrderDetails
on menuitems.menuitemID = orderdetails.menuitemID
inner join restaurants
on MenuItems.restaurantID = restaurants.restaurantID;


