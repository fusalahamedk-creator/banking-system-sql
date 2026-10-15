# Banking System SQL Project

## Project Description

This is a Banking System database project created using MySQL.

## Database Tables

- Customers
- Accounts
- Branch
- Card
- Loan
- Transactions

## SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- INSERT
- SELECT
- WHERE
- GROUP BY
- COUNT()
- MAX()
- MIN()
- INNER JOIN
- Primary Key
- Foreign Key
- Aggregate Functions

## Example Queries

### Find customers from Chennai

SELECT *
FROM customers
WHERE city = 'Chennai';

### Count total customers

SELECT COUNT(*) AS total_customers
FROM customers;

### Find maximum account balance

SELECT MAX(balance) AS total_balance
FROM accounts;

### Customer and account details

SELECT
    c.customer_name,
    a.account_id,
    a.account_type,
    a.balance
FROM customers c
INNER JOIN accounts a
ON c.customer_id = a.customer_id;