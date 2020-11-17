require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
# require 'cucumber_priority'

driver = ""

Before('@FilterByPrice') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end

Given('Access mens wear page') do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end

Then('Check if the range slider is working by moving the cursor to the right') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('Check if the range slider is working by moving the cursor to the left') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('Select the range ${int}-${int}') do |int, int2|
# Then('Select the range ${int}-${float}') do |int, float|
# Then('Select the range ${float}-${int}') do |float, int|
# Then('Select the range ${float}-${float}') do |float, float2|
  pending # Write code here that turns the phrase above into concrete actions
end


After('@FilterByPrice') do
	driver.close()
end
