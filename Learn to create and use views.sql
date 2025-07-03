CREATE TABLE StudentDetails (
    S_id INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Address VARCHAR(50)
);

INSERT INTO StudentDetails(S_id,Name,Address) VALUES
(1,'UMER','SURAT'),
(2,'Amaan','Kim'),
(3,'Aamir','Kosamba'),
(4,'Hussian','Bharuch'),
(5,'Saad','Bharuch'),
(6,'Assad','Kim');


SELECT * FROM StudentDetails;

CREATE TABLE StudentMarks (
    ID INT PRIMARY KEY,
    NAME VARCHAR(255),
    Marks INT,
    Age INT,
    FOREIGN KEY (Name) REFERENCES StudentDetails(Name)
);

INSERT INTO StudentMarks (ID, NAME, Marks, Age)VALUES
    (1, 'UMER', 90, 19),
    (2, 'Amaan', 50, 20),
    (3, 'Aamir', 80, 19),
    (4, 'Hussian', 95, 21),
    (5, 'Saad', 85, 18),
    (6,'Assad',98,18);
    
SELECT * FROM StudentMarks;
 
 -- Creating a Simple View from a Single Table
 CREATE VIEW DetailsView AS
 SELECT name,Address
 FROM StudentDetails 
 WHERE S_id < 6;
 
 -- use this query to retrieve the data from this view
 SELECT * FROM DetailsView;
 
 -- Deleting a View
 DROP VIEW DetailsView;
 
 
 -- create a view named DetailsNames from the table StudentDetails.
 CREATE VIEW DetailsName AS
 SELECT S_id,name 
 FROM StudentDetails
 ORDER BY name;


 SELECT * FROM DetailsName;
 
 -- Deleting a View
 DROP VIEW DetailsName;
 
 -- Creating a View From Multiple Tables
 
 CREATE VIEW MarksView AS
 SELECT StudentDetails.NAME,studentDetails.Address,StudentMarks.Marks
 FROM StudentDetails , StudentMarks
 WHERE StudentDetails.NAME = StudentMarks . NAME ;

SELECT * FROM MarksView ;

-- Listing all Views in a Database
SELECT table_schema, table_name, view_definition
FROM information_schema.views
WHERE table_schema = 'ecommerce';

-- Deleting a View
DROP VIEW MarksView;

-- Updating Data Through Views
CREATE OR REPLACE VIEW MarksView AS
SELECT s.NAME, s.ADDRESS, m.MARKS, m.AGE
FROM StudentDetails s
JOIN StudentMarks m ON s.NAME = m.NAME;

SELECT * FROM MarksView;

CREATE OR REPLACE VIEW DetailsView AS
SELECT NAME, ADDRESS
FROM StudentDetails;

-- Inserting Data into Views
INSERT INTO DetailsView(NAME, ADDRESS)
VALUES("Suresh", "Gurgaon");

-- Deleting a row from a View
DELETE FROM DetailsView
WHERE Address = "SURAT";

-- WITH CHECK OPTION Clause
CREATE VIEW SampleView AS
SELECT S_ID, NAME
FROM StudentDetails
WHERE NAME IS NOT NULL
WITH CHECK OPTION;

-- Insert
INSERT INTO SampleView(S_ID,NAME)
VALUES(8,'Mahera');

SELECT * FROM SampleView;

DROP VIEW SampleView;
