## Bank Tech Test

A solo tech test completed in a few hours that models a simple bank with a user and an account.

## Requirements

- Should be able to interact with the code via a REPL
- User can make deposits and withdrawals from an account
- An account can print a statement with the date, amount and balance
- Data can be kept in memory i.e. does not need to be stored to a database

## Acceptance Criteria

- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When she prints her bank statement, she would see:


```
date        || credit   ||  debit   || balance

14/01/2012  ||          ||  500.00  || 2500.00

13/01/2012  || 2000.00  ||          || 3000.00

10/01/2012  || 1000.00  ||          || 1000.00

```

## User Stories

```

As a User,
So I have a place to keep my money
I would like to be able to open a bank account

As a User
So I can store my money
I would like to be able to deposit money in my bank account

As a User
I so can retrieve money from my bank account
I would like to be able to withdraw money from my bank account

As a User
So I can see how much money I have in my account
I would like to be able to view my current balance

As a User
So I can see my past transactions
I would like to be able to print out my bank statement

```
