### 1. What is PostgreSQL?

**Answer:** PostgreSQL is a tool we can use to store and manage data. We can think of it like the Contacts app on our phone — where we save contact information and later search, update, or delete those contacts.

---

### 2. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

**Answer:** A primary key is a column or a set of columns in a table that uniquely identifies each row. For example, if we have two students named Raju Ahmed in our school, we need a way to uniquely identify each Raju. We can do this using the student ID, because each student has a unique ID. Or, if the two Rajus have different dates of birth, we can combine their name and date of birth as a primary key, since that combination would be unique.

A foreign key is also a column or set of columns, but it refers to the primary key in another table. For example, if we have a separate table that stores the courses taken by students, we can include student_id in that table. This student_id is a foreign key that refers to the primary key in the students table.

---

### 3. What is the difference between the VARCHAR and CHAR data types?

**Answer:** CHAR is a fixed-size data type. It always uses the same amount of space. For example, if you define a column as CHAR(4) but the word is only 'h', it will still take up 4 spaces (with 3 blank spaces added).

VARCHAR is a variable-size data type. It only uses as much space as needed. Using the same example, if the column is VARCHAR(4) and the word is 'h', it will only take up 1 space.

---

### 4. Explain the purpose of the WHERE clause in a SELECT statement.

**Answer:** The WHERE clause is used to filter rows from a table based on a given condition. For example, if we want to delete a specific Raju from our students table and there are 7 students named Raju, using a DELETE statement without a WHERE clause would delete all of them. To delete only the specific Raju, we use the WHERE clause with a unique identifier (like student_id), so only that one student is removed.

---

### 5. What are the LIMIT and OFFSET clauses used for?

**Answer:** LIMIT is used to specify how many rows we want to return from a query. For example, if we have 5 students but want to display only the first 2, we use LIMIT 2.

OFFSET is used to skip rows before starting to return results. For example, OFFSET 2 skips the first 2 rows and shows results starting from the 3rd row.

When combined — for example, LIMIT 2 OFFSET 2 — it will skip the first 2 rows and then show the next 2 rows.
