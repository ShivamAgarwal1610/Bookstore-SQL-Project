 -- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:

SELECT b.Genre , SUM(o.Quantity) as Total_Books_Sold
FROM BOOKS b
JOIN ORDERS o
ON (b.book_id = o.book_id)
GROUP BY b.Genre

-- 2) Find the average price of books in the "Fantasy" genre:

SELECT AVG(Price) as Average_price
FROM BOOKS
WHERE Genre = 'Fantasy'

-- 3) List customers who have placed at least 2 orders:

SELECT O.Customer_ID , C.Name , COUNT(O.order_id)
FROM CUSTOMERS C
JOIN ORDERS O
ON (C.Customer_ID = O.Customer_ID)
GROUP BY O.customer_id, C.name
HAVING COUNT(Order_id) >=2;

-- 4) Find the most frequently ordered book:

SELECT o.Book_id, b.title, COUNT(o.order_id) AS ORDER_COUNT
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id, b.title
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :

SELECT * FROM BOOKS
WHERE Genre = 'Fantasy'
ORDER BY PRICE DESC
LIMIT 3

-- 6) Retrieve the total quantity of books sold by each author:

SELECT b.author , SUM(o.quantity) AS total_books_sold
FROM BOOKS b
JOIN orders o
ON ( o.book_id = b.book_id)
GROUP BY b.author

-- 7) List the cities where customers who spent over $30 are located:

SELECT DISTINCT C.CITY , O.Total_Amount
FROM CUSTOMERS C
JOIN ORDERS O
ON (O.CUSTOMER_ID = C.CUSTOMER_ID)
WHERE O.Total_Amount > 30

-- 8) Find the customer who spent the most on orders:

SELECT C.Customer_id , C.Name , SUM(O.Total_Amount) AS total_spent
FROM CUSTOMERS C
JOIN ORDERS O
ON (o.Customer_id = C.Customer_id)
GROUP BY C.Customer_id , C.Name
ORDER BY total_spent Desc
LIMIT 1

--9) Calculate the stock remaining after fulfilling all orders:

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id 
ORDER BY b.book_id;
