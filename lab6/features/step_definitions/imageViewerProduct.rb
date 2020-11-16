require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
# require 'cucumber_priority'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver


Given("Access the page - Men's wear") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end
# end.overridable

Then('​​Click on any product ') do
	pending
end

Then('Put the cursor of the image of the product in image viewer') do
	pending
end

Then('Move the cursor on the image') do
	pending
end

Then ('Click on second image from the image slider') do
	pending
end

Then('Click on the third image from the image slider') do
	pending
end

Then('Click on the first image from the image slider') do
	pending
end
