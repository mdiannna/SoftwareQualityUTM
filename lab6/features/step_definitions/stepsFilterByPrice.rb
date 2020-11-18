require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = ""

Before('@FilterByPrice') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end


def moveSlider(driver, slider, value)
	driver.action
		   .drag_and_drop_by(slider, value, 0)
		   .perform()
end


def moveSliderByVal(driver, slider, value)
	minValue = 0
	maxValue = 3000
	sliderW = 	720
	# driver.action.move_to(slider, (value * sliderW / (maxValue - minValue)).to_i(), 0).click().build().perform()
	driver.action.move_to(slider, (value * sliderW / (maxValue - minValue)).to_i(), 0).click().perform()
end


def moveNewPixels(driver, slider, pixels)
	sliderW = 	720
	
	driver.action.click_and_hold(slider)
	.move_by((-sliderW / 2), 0)
	.move_by(pixels, 0).release().perform()
end


def getSliderHandles(driver)
	sliderHandles = driver.find_elements(:class, 'ui-slider-handle')
	if sliderHandles[0].location.x.to_i() < sliderHandles[1].location.x.to_i()
		sliderHandleLeft = sliderHandles[0]
		sliderHandleRight = sliderHandles[1]
	else
		sliderHandleLeft = sliderHandles[1]
		sliderHandleRight = sliderHandles[0]
	end

	return sliderHandleLeft, sliderHandleRight
end


Given('Access mens wear page') do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end

Then('Check if the range slider is working by moving the cursor to the right') do
	slider = driver.find_element(:id, "slider-range")
	
	moveSlider(driver, slider, -30)
	sleep(1)
end


Then('Check if the range slider is working by moving the cursor to the left') do
	slider = driver.find_element(:id, "slider-range")
	
	moveSlider(driver, slider, 0)
	moveSlider(driver, slider, 30)

	sleep(1)
end


def getSliderAmount(driver)
	amount = driver.find_element(:id, "amount").attribute('value')
	log("amount:", amount)
	log("amount split:", amount.delete(" $").split("-"))
	
	leftAmount, rightAmount = amount.delete(" $").split("-")

	return leftAmount.to_f, rightAmount.to_f
end


Then('Select the range approx. ${int}-${int} and check products') do |int1, int2|
	slider = driver.find_element(:id, "slider-range")
	sleep(1)
	amountOnePixel = 3000/720.0

	moveSlider(driver, slider, 0)

	sliderHandleLeft, sliderHandleRight = getSliderHandles(driver)

	currentPosRight = 1500
	currentPosLeft = (sliderHandleLeft.location.x.to_f - slider.location.x.to_f + sliderHandleLeft.size.width.to_f/2) * amountOnePixel

	sleep(1)
	
	driver.action.drag_and_drop_by(sliderHandleRight, (-(currentPosRight-int2+3)/amountOnePixel).to_f(), 0).click().perform()
	sleep(0.5)
	driver.action.drag_and_drop_by(sliderHandleLeft, (-(currentPosLeft-int1-1)/amountOnePixel).to_f(), 0).click().perform()
	sleep(0.5)


	leftAmount, rightAmount = getSliderAmount(driver)

	products = driver.find_elements(:class, 'simpleCart_shelfItem')

	prices = []

	products.each do |el|

		if el.displayed?
	    	price = el.find_element(:class, "item_price")

			priceText = price.text
			priceText.slice! '$'
			prices.push(priceText.to_f())
		end
	end

	expect(prices.min >= leftAmount)
	expect(prices.max <=rightAmount)
	
	sleep(1)

end


After('@FilterByPrice') do
	driver.close()
end
