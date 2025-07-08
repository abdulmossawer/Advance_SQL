-- Copy data from 'customers' table into 'persons'

CREATE TABLE persons (
	id INT NOT NULL,
	person_name VARCHAR(50) NOT NULL,
	birth_date DATE,
	phone VARCHAR(15) NOT NULL
	CONSTRAINT pk_person PRIMARY KEY (id)
);

INSERT INTO persons (id, person_name, birth_date, phone) 
SELECT
id,
first_name,
NULL AS 'birth_date',
'Unknown' AS 'phone'
FROM customers;

SELECT * FROM persons;

DROP TABLE persons;

-- Delete all data from table persons

TRUNCATE TABLE persons