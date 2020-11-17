require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
# require 'cucumber_priority'

driver = ""

Before('@FilterByPrice') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end


def moveSlider(driver, slider, value)
	# driver.action.move_to(slider)
	driver.action
		   .drag_and_drop_by(slider, value, 0)
		   .perform()
end


def moveSliderByVal(driver, slider, value)
	# minValue = 20
	minValue = 0
	maxValue = 3000
	sliderW = 	720
	# driver.action.move_to(slider, (value * sliderW / (maxValue - minValue)).to_i(), 0).click().build().perform()
	driver.action.move_to(slider, (value * sliderW / (maxValue - minValue)).to_i(), 0).click().perform()

    # action.moveToElement(slider, (int) (value * sliderW / (maxValue - minValue)), 0).click().build().perform();
end


# def getPixelsToMove(slider, amount, maxvalUe, minValue)
def getPixelsToMove(amount)
    pixels = 0
	sliderW = 	720

	minValue = 0
	maxValue = 3000
    tempPixels = sliderW
    tempPixels = tempPixels / (maxValue - minValue);
    tempPixels = tempPixels * (amount - minValue);

    pixels = tempPixels.to_i()

    return pixels
end


def moveNewPixels(driver, slider, pixels)
	sliderW = 	720
	
	driver.action.click_and_hold(slider)
	.move_by((-sliderW / 2), 0)
	.move_by(pixels, 0).release().perform()
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
	
	# moveSlider(driver, slider, 30)
	moveSlider(driver, slider, 0)
	
	sleep(1)

	log("slider:", slider)
	# log("slider size:", slider.get_size())

	log("slider full size:", slider.size())
	sliderEl = slider.find_element(:class, "ui-slider-range")
	log("slider el size:", sliderEl.size())



	##########33 For test - next TODO
	sliderHandles = driver.find_elements(:class, 'ui-slider-handle')
	if sliderHandles[0].location.x.to_i() < sliderHandles[1].location.x.to_i()
		sliderHandleLeft = sliderHandles[0]
		sliderHandleRight = sliderHandles[1]
	else
		sliderHandleLeft = sliderHandles[1]
		sliderHandleRight = sliderHandles[0]
	end

	# driver.action.move_to(sliderHandleLeft, 50, 0).click().perform()
	amountOnePixel = 3000/720.0

	# driver.action.drag_and_drop_by(sliderHandleLeft, 20.0/amountOnePixel, 0).perform()
	sleep(1)
	log("!!!", (-1300.0/amountOnePixel).to_f())
	# driver.action.drag_and_drop_by(sliderHandleRight, -1300/amountOnePixel, 0).perform()
	# driver.action.drag_and_drop_by(sliderHandleRight, (-1300.0/amountOnePixel).round(), 0).click().perform()

	# !!! below works but need to add width of slider!!
	# 3 este de fapt widthul elementului mic din slider
	# 1300 este diferenta de la 1500 pana la 200
	# 20-200
	driver.action.drag_and_drop_by(sliderHandleRight, (-1301.0/amountOnePixel).to_f()-3, 0).click().perform()

	# driver.action.move_to(sliderHandleRight, 100, 0).click().perform()
	sleep(1)

	# stanga la 0
	driver.action.drag_and_drop_by(sliderHandleLeft, (-20/amountOnePixel).to_f()-6, 0).click().perform()

	# dreapta la 0
	driver.action.drag_and_drop_by(sliderHandleRight, (-200.0/amountOnePixel).to_f()-3, 0).click().perform()
	sleep(0.5)

	# 38-63
	# driver.action.drag_and_drop_by(sliderHandleRight, (60.0/amountOnePixel).to_f()-2.35, 0).click().perform()
	driver.action.drag_and_drop_by(sliderHandleRight, (60.0/amountOnePixel).to_f()-2.35, 0).click().perform()
	driver.action.drag_and_drop_by(sliderHandleLeft, (40/amountOnePixel).to_f()-2.7, 0).click().perform()

	sleep(1)

	# stanga la 0
	driver.action.drag_and_drop_by(sliderHandleLeft, (-40/amountOnePixel).to_f()-6, 0).click().perform()

	# dreapta la 0
	driver.action.drag_and_drop_by(sliderHandleRight, (-60/amountOnePixel).to_f()-3, 0).click().perform()
	sleep(0.5)

	driver.action.drag_and_drop_by(sliderHandleRight, (2000.0/amountOnePixel).to_f()-3, 0).click().perform()
	driver.action.drag_and_drop_by(sliderHandleLeft, (200/amountOnePixel).to_f(), 0).click().perform()
	sleep(1)

end

Then('Select the range ${int}-${int}') do |int1, int2|	
# Then('Select the range ${int}-${float}') do |int, float|
# Then('Select the range ${float}-${int}') do |float, int|
# Then('Select the range ${float}-${float}') do |float, float2|
	log("Range:", int1, int2)
	slider = driver.find_element(:id, "slider-range")

	amount = driver.find_element(:id, "amount").attribute('value')
	log("amount:", amount)
	amount.slice! '$20 - $'
	log("1: -- ", amount)

	# move 10px
	# moveSlider(driver, slider, 10)

	amount2 = driver.find_element(:id, "amount").attribute('value')
	log("amount:", amount2)
	amount2.slice! '$20 - $'

	log("2: -- ", amount2)

	# log("10 pixels == ", (amount2.to_i() - amount.to_i()).abs(), "$")

	# amountOnePixel = (amount2.to_i() - amount.to_i()).abs()/10.0

	# moveSlider(driver, slider, -10)


	# moveSlider(driver, slider, 0)
	
	# amountToMove = (amount2.to_i() - int2.to_i())

	amountOnePixel = 3000.0/720
	log("amountOnePixel:", amountOnePixel)

	# if amountOnePixel>0
	# pixelsToMove = -amountToMove / amountOnePixel
	# pixelsToMove = int2 / amountOnePixel

	# log("amountToMove:", amountToMove)
	# log("pixelsToMove:", pixelsToMove)


	# driver.action.move_to(slider, 50, 0).click().perform()
	# driver.action.move_to(slider, 3, 0).click().perform()
	# driver.action.move_to(slider, 1, 0).click().perform() 1 -> 4???

	# driver.action.move_to(slider, 0, 0).click().perform() #slider din stanga

	# moveSliderByVal(driver, slider, 0) #!!! merge asa stanga
	# sleep(1)
	moveSliderByVal(driver, slider, int1) #!!! merge asa stanga

	# amount = int2
	# pixelsToMove = getPixelsToMove(amount2.to_i()- amount)

	# moveNewPixels(driver, slider, pixelsToMove)


	# moveSlider(driver, slider, pixelsToMove)
	# moveSlider(driver, slider, -(int2 / amountOnePixel))
	# moveSlider(driver, slider, (amount2.to_i() - int2) / amountOnePixel)
	# moveSliderByVal(driver, slider, (amount2.to_i() - int2) / amountOnePixel)
	# moveSliderByVal(driver, slider, 200)
	# moveSlider(driver, slider, -(amount2.to_i()-100) /amountOnePixel)
	currentAmount = 0
	desiredAmount = 40

	# moveSliderByVal(driver, slider, 30)
	# moveSliderByVal(driver, slider, pix)

	# while (currentAmount - desiredAmount).abs >9
	# 	# moveSliderByVal(driver, slider, 10)
	# 	moveSlider(driver, slider, 10)
	# 	sleep(1)

	# 	amount = driver.find_element(:id, "amount").attribute('value')
	# 	log("amount:", amount)
	# 	currentAmount = amount[2,4].to_i()

	# end
	sleep(2)

end


After('@FilterByPrice') do
	driver.close()
end
