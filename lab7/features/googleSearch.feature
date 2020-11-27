@SearchOnGoogle
Feature: Search on google.com


@NonExistingData
Scenario: Enter not existing data means ++++++, 
Given Go to google.com
Then Write non existing data ++++++
Then It should not match anything
Then It should not display anything