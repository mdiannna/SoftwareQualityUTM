@CommunityPoll
Feature: Community Poll

@Poll
Scenario: Verify comunity poll feature on men's clothes page
Given Open Men's clothes page
Then Select option 'More colors to choose' from the poll options
Then validate result community poll