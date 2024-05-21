
-- Задача 1. Вывести заказы со стоимостью от 5000 и более EUR (проекция: номер_заказа, стоимость_заказа)
SELECT
OrderDetails.OrderID,
SUM(Products.Price * OrderDetails.Quantity) AS total_cost
FROM OrderDetails

JOIN Products ON Products.ProductID = OrderDetails.ProductID
Group BY OrderDetails.OrderID
Having
total_cost > 5000
-- Задача 2. Вывести страны, в которые было отправлено 3 и более заказов
SELECT
SELECT
Customers.Country, 
COUNT(Orders.OrderID) AS total_orders
From Orders 
Join Customers ON Customers.CustomerID = Orders.CustomerID
Group By Customers.Country
Having
total_orders >= 3

-- Задача 3. Вывести ТОП-10 самых продаваемых товаров (проекция: название_товара, ко_во_проданных_единиц)
SELECT
Products.ProductName,
SUM(OrderDetails.Quantity) AS total_quantity
FROM OrderDetails
Join Products ON Products.ProductID = OrderDetails.ProductID
Group BY Products.ProductID
Order BY total_quantity DESC
Limit 10
-- Задача 4. Расчитать З/П менеджеров (ставка - 5% от суммы проданных заказов)
SELECT
Orders.EmployeeID,
SUM(Products.Price * OrderDetails.Quantity) AS total_price,
COUNT(Orders.OrderID) AS total_orders_employee,
SUM(Products.Price * OrderDetails.Quantity) * 0.05 AS employee_commission
FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.EmployeeID