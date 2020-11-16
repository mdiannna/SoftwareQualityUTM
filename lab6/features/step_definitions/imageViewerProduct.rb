require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
# require 'cucumber_priority'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver


Given("Access the page - Men's wear") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end
# end.overridable

Then('​​Click on any product') do
	products = driver.find_elements(:class, 'simpleCart_shelfItem')
	products[0].click
end

Then('Put the cursor of the image of the product in image viewer') do
	el = driver.find_element(:css, "div[class='imagezoom-cursor']")
	driver.action.move_to(el).perform
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
