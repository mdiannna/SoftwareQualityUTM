require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver


Given("Open men clothes page") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end


# Then("Choose Price(Low-High) option in the Sort By select") do
Then('Choose Price\(Low-High) option in the Sort By select') do

	# dropDownMenu = @driver.find_element(:class, 'dropDownMenu')
	dropDownMenu = driver.find_element(:id, 'country1')

	option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
	option.select_by(:text, 'Price(Low - High)')
	# option.select_by(:value, '0')


	# TODO:!!!! Check if results are sorted!!!

    # sleep(1)                                                                # sleep/pause 2 second
end