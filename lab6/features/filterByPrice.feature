@FilterByPrice
Feature: Filter by price functionality in Men's wear


Scenario: Test if Filter by price functionality is working on Men's wear page.
Given Access mens wear page
Then Check if the range slider is working by moving the cursor to the right
Then Check if the range slider is working by moving the cursor to the left
Then Select the range approx. $20-$100 and check products
Then Select the range approx. $40-$60 and check products
Then Select the range approx. $200-$2000 and check products