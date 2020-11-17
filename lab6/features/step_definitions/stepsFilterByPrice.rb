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
	slider = driver.find_element(:id, "slider-range")
	
	driver.action.move_to(slider)
		   .click()
		   .drag_and_drop_by(slider, -30, 0)
		   .perform()
	sleep(1)

	log("slider:", slider)
	# log("slider size:", slider.get_size())

	log("slider full size:", slider.size())
	sliderEl = slider.find_element(:class, "ui-slider-range")
	log("slider el size:", sliderEl.size())
end


Then('Check if the range slider is working by moving the cursor to the left') do
	slider = driver.find_element(:id, "slider-range")
	
	driver.action.move_to(slider)
		   .click()
		   .drag_and_drop_by(slider, 50, 0)
		   .perform()
	sleep(1)

	log("slider:", slider)
	# log("slider size:", slider.get_size())

	log("slider full size:", slider.size())
	sliderEl = slider.find_element(:class, "ui-slider-range")
	log("slider el size:", sliderEl.size())

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
