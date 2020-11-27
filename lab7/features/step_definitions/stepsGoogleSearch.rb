require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = ""

Before('@SearchOnGoogle') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end


Given('Go to google.com') do
  driver.navigate.to "https://www.google.com/"         # direct to site
end

Then('Write non existing data ++++++') do
 	# TODO		
	pending
end

After('@SearchOnGoogle') do
	driver.close()
end