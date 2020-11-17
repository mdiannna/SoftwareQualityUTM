require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
# require 'cucumber_priority'

driver = ""

Before('@FilterByPrice') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end


def moveSlider(driver, slider, value)
	driver.action.move_to(slider)
		   # .click()
		   .drag_and_drop_by(slider, value, 0)
		   .perform()
end


Given('Access mens wear page') do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end

Then('Check if the range slider is working by moving the cursor to the right') do
	slider = driver.find_element(:id, "slider-range")
	
	moveSlider(driver, slider, -30)
	sleep(1)

	log("slider:", slider)
	# log("slider size:", slider.get_size())

	log("slider full size:", slider.size())
	sliderEl = slider.find_element(:class, "ui-slider-range")
	log("slider el size:", sliderEl.size())
end


Then('Check if the range slider is working by moving the cursor to the left') do
	slider = driver.find_element(:id, "slider-range")
	
	moveSlider(driver, slider, 50)
	
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
	
	slider = driver.find_element(:id, "slider-range")

	amount = driver.find_element(:id, "amount").attribute('value')
	log("amount:", amount)
	amount.slice! '$20 - $'
	log("1: -- ", amount)

	# move 10px
	moveSlider(driver, slider, 10)

	amount2 = driver.find_element(:id, "amount").attribute('value')
	log("amount:", amount2)
	amount2.slice! '$20 - $'

	log("2: -- ", amount2)

	log("10 pixels == ", (amount2.to_i() - amount.to_i()).abs(), "$")

	amountOnePixel = (amount2.to_i() - amount.to_i()).abs()/10.0


	amountToMove = -(amount2.to_i() - int2.to_i())
	pixelsToMove = amountToMove / amountOnePixel

	log("amountToMove:", amountToMove)
	log("pixelsToMove:", pixelsToMove)

	moveSlider(driver, slider, pixelsToMove)
	sleep(2)

end


After('@FilterByPrice') do
	driver.close()
end
