-- 1) Retrieve all books in the "Fiction" genre:

SELECT * FROM BOOKS
WHERE Genre = 'fiction'

-- 2) Find books published after the year 1950:

SELECT * FROM BOOKS
WHERE PUBLISHED_YEAR > 1950

-- 3) List all customers from the Canada:

SELECT * FROM CUSTOMERS
WHERE COUNTRY = 'Canada'

-- 4) Show orders placed in November 2023:

SELECT * FROM ORDERS
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'

-- 5) Retrieve the total stock of books available:

SELECT SUM(Stock) as total_stocks
FROM BOOKS


-- 6) Find the details of the most expensive book:

SELECT * FROM BOOKS
ORDER BY PRICE DESC
LIMIT 1

-- 7) Show all customers who ordered more than 1 quantity of a book:

SELECT * FROM ORDERS
WHERE Quantity > 1

-- 8) Retrieve all orders where the total amount exceeds $20:

SELECT * FROM ORDERS
WHERE Total_Amount > 20

-- 9) List all genres available in the Books table:

SELECT DISTINCT Genre FROM BOOKS

-- 10) Find the book with the lowest stock:

SELECT * FROM BOOKS
ORDER BY STOCK
LIMIT 1

-- 11) Calculate the total revenue generated from all orders:

SELECT SUM(Total_Amount) as total_revenue_generated
FROM ORDERS

