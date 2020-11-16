require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
# require 'cucumber_priority'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver


Given("Open Page Men's clothes") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end
# end.overridable


Then('Go to the first product and click on "Add to Cart"') do
	log("Hello!")
	# item = driver.find_elements(:class, 'simpleCart_shelfItem')[0]
	# for el in driver.find_elements(:class,'check_box')

	itemDescription = driver.find_element(:xpath, "//div[contains(@class,'simpleCart_shelfItem')]//div[contains(@class,'item-info-product')]//h4")
	log("Item text:")
	log(itemDescription.text)

	# itemPrice = driver.find_element(:xpath, "//div[contains(@class,'simpleCart_shelfItem')]//span[contains(@class,'item-price')]")
	itemPrice = driver.find_element(:class, "item_price")
	log("Item price:")
	log(itemPrice.text)
	

	elem = driver.find_element(:xpath, "//div[contains(@class,'simpleCart_shelfItem')]//input[@type='submit']").click()
	sleep(1)
	# log(elem.text)		


	cartItem = driver.find_element(:id, "PPMiniCart")
	log("Cart item:")
	log(cartItem.text)

	# assert itemText in cartItem.text
    # expect(itemText).to eq('Search Indonesian pages')                      # validate items equal 
    expect(cartItem.text.downcase).to include(itemDescription.text.downcase)
    expect(cartItem.text).to include(itemPrice.text)




	# driver.findElement(By.xpath("//input[@type='submit']")).click();

# WebElement medium = big.findElement(By.xpath(".//div[contains(@class,'Medium')]"));

	# item.find_element(:css,'[type="submit"]').click                       # click submit 
	# log(item.text)
end