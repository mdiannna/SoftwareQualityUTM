@FilterByPrice
Feature: Filter by price functionality in Men's wear


Scenario: Test if Filter by price functionality is working on Men's wear page.
Given Access mens wear page
Then Check if the range slider is working by moving the cursor to the right
Then Check if the range slider is working by moving the cursor to the left
Then Select the range $20-$100
Then Select the range $40-$60
Then Select the range $200-$2000