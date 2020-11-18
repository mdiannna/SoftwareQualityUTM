require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = ""

Before('@RemoveFromCart') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end


Given('Go to mens wear page') do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end


Then('Go to the first product and click on Add to Cart') do
	
	itemDescription = driver.find_element(:xpath, "//div[contains(@class,'simpleCart_shelfItem')]//div[contains(@class,'item-info-product')]//h4")
	log("Item text:")
	log(itemDescription.text)

	itemPrice = driver.find_element(:class, "item_price")
	log("Item price:")
	log(itemPrice.text)
	

	elem = driver.find_elements(:xpath, "//div[contains(@class,'simpleCart_shelfItem')]//input[@type='submit']")[0]
	elem.click()
	sleep(1)


	cartItem = driver.find_element(:id, "PPMiniCart")
	log("---Cart content:---")
	log(cartItem.text)

    expect(cartItem.text.downcase).to include(itemDescription.text.downcase)
end


Then('Go to the second product and click on Add to Cart') do
  
	itemDescription = driver.find_elements(:xpath, "//div[contains(@class,'simpleCart_shelfItem')]//div[contains(@class,'item-info-product')]//h4")[1]
	log("Item text:")
	log(itemDescription.text)

	itemPrice = driver.find_elements(:class, "item_price")[1]
	log("Item price:")
	log(itemPrice.text)
	

	elem = driver.find_elements(:xpath, "//div[contains(@class,'simpleCart_shelfItem')]//input[@type='submit']")[1]
	elem.click()

	sleep(1)

	cartItem = driver.find_element(:id, "PPMiniCart")
	log("---Cart content:---")
	log(cartItem.text)

    expect(cartItem.text.downcase).to include(itemDescription.text.downcase)
end


Then('Click on the "x" button of the second product in the cart window') do
	itemDescription = driver.find_elements(:xpath, "//div[contains(@class,'simpleCart_shelfItem')]//div[contains(@class,'item-info-product')]//h4")[1]
	log("Item text:")
	log(itemDescription.text)

	xButton = driver.find_element(:css, "button[class='minicart-remove']")
	xButton.click()

	sleep(0.5)

	cartItem = driver.find_element(:id, "PPMiniCart")
	log("---Cart content:---")
	log(cartItem.text)

    expect(cartItem.text.downcase).not_to include(itemDescription.text.downcase)

end



After('@RemoveFromCart') do
	driver.close()
end