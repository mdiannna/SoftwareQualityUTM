@FilterByPrice
Feature: Filter by price functionality in Men's wear
Test if Filter by price functionality is working on Men's wear page.


@FilterByPriceCursorRight
Scenario: Filter by price - cursor to the right
Given Access mens wear page
Then Check if the range slider is working by moving the cursor to the right


@FilterByPriceCursorLeft
Scenario: Filter by price - cursor to the left
Given Access mens wear page
Then Check if the range slider is working by moving the cursor to the left


@FilterByPriceRange1
Scenario: Filter by price - range 20-100
Given Access mens wear page
Then Select the range $20-$100


@FilterByPriceRange2
Scenario: Filter by price - range 40-60
Given Access mens wear page
Then Select the range $40-$60


@FilterByPriceRange3
Scenario: Filter by price - range 200-2000
Given Access mens wear page
Then Select the range $200-$2000