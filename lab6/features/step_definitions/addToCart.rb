require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
# require 'cucumber_priority'

driver = ""

Before('@AddToCart') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end

Given("Open Page Men's clothes") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end


Then('Go to the first product and click on "Add to Cart"') do
	log("Hello!")

	itemDescription = driver.find_element(:xpath, "//div[contains(@class,'simpleCart_shelfItem')]//div[contains(@class,'item-info-product')]//h4")
	log("Item text:")
	log(itemDescription.text)

	itemPrice = driver.find_element(:class, "item_price")
	log("Item price:")
	log(itemPrice.text)
	

	elem = driver.find_element(:xpath, "//div[contains(@class,'simpleCart_shelfItem')]//input[@type='submit']").click()
	sleep(1)


	cartItem = driver.find_element(:id, "PPMiniCart")
	log("Cart item:")
	log(cartItem.text)

    expect(cartItem.text.downcase).to include(itemDescription.text.downcase)
    expect(cartItem.text).to include(itemPrice.text)
end



After('@AddToCart') do
	driver.close()
end
