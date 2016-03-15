ex1 
SELECT isbn FROM editions 
JOIN publishers 
ON editions.publisher_id = publishers.id 
WHERE publishers.name = 'Random House';

ex2
SELECT editions.isbn, books.title FROM editions
JOIN publishers 
ON editions.publisher_id = publishers.id
JOIN books
ON books.id = editions.book_id
WHERE publishers.name = 'Random House';

ex3
SELECT editions.isbn, books.title, stock.retail, stock.stock FROM editions
JOIN publishers 
ON editions.publisher_id = publishers.id
JOIN books
ON books.id = editions.book_id
JOIN stock
ON stock.isbn = editions.isbn
WHERE publishers.name = 'Random House';

ex4
SELECT editions.isbn, books.title, stock.retail, stock.stock FROM editions
JOIN publishers
ON editions.publisher_id = publishers.id
JOIN books
ON books.id = editions.book_id
JOIN stock
ON stock.isbn = editions.isbn
WHERE publishers.name = 'Random House' AND stock.stock != 0;

ex5
SELECT editions.isbn, books.title, stock.retail, stock.stock,
CASE WHEN  editions.type = 'h' THEN 'hardcover'
     WHEN editions.type = 'p' THEN 'paperback' 
END
FROM editions
JOIN publishers
ON editions.publisher_id = publishers.id
JOIN books
ON books.id = editions.book_id
JOIN stock
ON stock.isbn = editions.isbn
WHERE publishers.name = 'Random House' AND stock.stock != 0;

ex6 

ex7
SELECT sum(stock) from stock;

ex8
SELECT avg(retail) AS "Average Retail", avg(cost) AS "Average Cost", avg(retail - cost) AS "Average Profit" FROM stock; 

ex9
SELECT sum(stock) AS whats_in_stock, book_id 
FROM stock LEFT JOIN editions ON stock.isbn  = editions.isbn
GROUP BY book_id ORDER BY whats_in_stock DESC LIMIT 1;
