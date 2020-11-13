@CommunityPoll2
Feature: Community Poll

@Poll
Scenario: Verify comunity poll feature on men's clothes page
Given Open men's clothes page
Then Select option 'Lower price' from the poll options
Then Validate result community poll