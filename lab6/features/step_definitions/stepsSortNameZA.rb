require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver


Given("Open page men's clothes") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end


Then('Choose Name\(Z - A) option in the Sort By select') do

	# dropDownMenu = @driver.find_element(:class, 'dropDownMenu')
	dropDownMenu = driver.find_element(:id, 'country1')

	option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
	option.select_by(:text, 'Name(Z - A)')
	# option.select_by(:value, '0')


	# TODO:!!!! Check if results are sorted!!!

    # sleep(1)                                                                # sleep/pause 2 second
end