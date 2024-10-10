-- Database Schema Overview:
-- This schema manages a library system with three main entities: Books, Members, and Loans.
-- Books table stores information about books available in the library.
-- Members table stores information about library members.
-- Loans table tracks loans made by members, including loan date and return date.
-- ========================================================================
--library Management project

-- Create Books table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,  -- Unique identifier for books
    Title VARCHAR(100),             -- Title of the book
    Author VARCHAR(100),            -- Author of the book
    Genre VARCHAR(50),              -- Genre of the book
    Quantity INT                    -- Quantity of the book available in the library
);


-- Insert new records into Books table
INSERT INTO Books (ISBN, Title, Author, Genre, Quantity)
VALUES
('978-0316000000', 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 5),
('978-0439064873', 'Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'Fantasy', 3),
('978-0439139601', 'Harry Potter and the Prisoner of Azkaban', 'J.K. Rowling', 'Fantasy', 4);

-- Create Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,       -- Unique identifier for members
    Name VARCHAR(100),              -- Name of the member
    Email VARCHAR(100),             -- Email address of the member
    Phone VARCHAR(20)               -- Phone number of the member
);


-- Insert new records into Members table
INSERT INTO Members (MemberID, Name, Email, Phone)
VALUES
(1, 'Safeeullah', 'safee77@gmail.com', '304-933-3366'),
(2, 'Ahmad Sajid', 'sajidahmad@gmail.com', '306-945-4577');


-- Create Loans table
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,         -- Unique identifier for loans
    MemberID INT,                   -- Foreign key referencing MemberID in Members table
    ISBN VARCHAR(20),               -- Foreign key referencing ISBN in Books table
    LoanDate DATE,                  -- Date when the book was borrowed
    ReturnDate DATE,                -- Date when the book was returned (can be NULL if not returned yet)
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),  -- Define foreign key constraint
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)             -- Define foreign key constraint
);



-- Insert new records into Loans table
INSERT INTO Loans (LoanID, MemberID, ISBN, LoanDate, ReturnDate)
VALUES
(1, 1, '978-0316000000', '2024-05-09', '2024-05-15'),
(2, 2, '978-0439064873', '2024-05-09', NULL); -- Assuming the book is not returned yet


--  questions/queries to solve


select * from books   --isbn, title,author,genre,quantity
 select * from members -- memberid,name,email,phone
 select * from loans  -- loanid,memberid,isbn,loandate,returndate



-- Retrieve all information about books borrowed by a specific member
select books.title, books.author, loans.loandate, loans.returndate
from books 
join Loans  on 
	books.isbn = loans.isbn
where memberid = 1


-- Update the quantity of a particular book in the Books table

select * from books

update books
set quantity = 6
where isbn='978-0439064873';


-- Delete a member record from the Members table
select * from members
delete from members
where  email='safee77@gmail.com';


-- 3. Write queries to find overdue books and their borrowers.

--  need to check on this!!

select * from books   --isbn, title,author,genre,quantity
 select * from members -- memberid,name,email,phone
 select * from loans  -- loanid,memberid,isbn,loandate,returndate

select books.title, books.quantity,loans.loandate
from books
join loans 
on books.isbn= loans.isbn





 




