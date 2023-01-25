use Univer
SELECT *
FROM Authors FULL JOIN Books
ON Authors.AuthorID = Books.BookID

SELECT * FROM Authors FULL JOIN Books
ON Authors.AuthorID = Books.BookID
Where Authors.AuthorID is null

SELECT * FROM Authors FULL JOIN Books
ON Authors.AuthorID = Books.BookID
Where Authors.AuthorID is not null