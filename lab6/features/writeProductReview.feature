@ProductReviewFunctionality
Feature: Test write a review in products page

@WriteReview
Scenario: Test feature to write a review in products page form
Given Access the products page
Then ​Click on tab Reviews
Then Write name in the field "Name" (first field)
Then Negative test - write the email without @ in the email field and press enter
Then ​Write the correct email in the field Email (first field)
Then Write the review in the textarea
Then ​Click on SEND button