@SearchOnGoogle
Feature: Search on google.com


@SearchNonExistingData
Scenario: Enter not existing data means ++++++ in google search 
Given Go to google.com
Then Write non existing data ++++++ in search input
Then Click search
Then It should not display any results



@SearchExistingData
Scenario: Enter existing data in google search
Given Go to google.com
Then Write word "Technical" in search input
Then Click search
Then It should display results for "Technical" word search
Then Results should be similar to term "Technical"