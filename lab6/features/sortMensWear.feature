@SortMensWear
Feature: Sort products in men's wear page

@SortAZ
Scenario: Verify if Sort name A-Z is working in men's wear page
Given Open Men clothes page
Then Choose Name(A - Z) option in the Sort By select


@SortZA
Scenario: Verify if Sort name Z-A is working in men's wear page
Given Open page men's clothes
Then Choose Name(Z - A) option in the Sort By select


@SortPriceAscending
Scenario: Verify if Sort price ascending is working in men's wear page
Given Open men clothes page
Then Choose Price(Low-High) option in the Sort By select


@SortPriceDescending
Scenario: Verify if Sort price descending is working in men's wear page
Given Open men's clothes webpage
Then Choose Price(High-Low) option in the Sort By select