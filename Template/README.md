
# Welcome 👋
Thank you for applying to work as an iOS Developer at Barclays. Please complete the below scenario as part of your application process.

## Scenario 🏦
You are working as an iOS Developer in a team working on a feature focusing on the customers accounts and transactions screen.

Using the example API response contained in the file `Accounts.txt`, create an application which parses the files and displays the information. 

There is purposefully more json and scope for functionality than can be built in a reasonable time. We are not expecting you to use/display all of the json.

The application UI should be enough to allow us to see your application run, but animations/elaborate designs etc are not required.

What we want to see:

- Good software design principles and coding patterns 
- Clean and bug free code
- Some example unit tests 
 
## Assumptions 🤔
You can make use of any/all code provided to you and edit it as you see fit. Please do not alter the provided json. 

All dates are in the format `dd/MM/yyyy`.

A single customer can have multiple accounts, and each account can have multiple cards. Each transaction is linked to a single account 

## Starting Steps 💻
The below steps are a guide to get you started...

1. Create a new Xcode project and add the files Accounts.txt and Accounts.swift
2. Using `Bundle.main.path(forResource: "Accounts", ofType: "txt")` find the `URL` of the file
3. Retrieve the contents of the file
4. Serialise the json within and display to the user
