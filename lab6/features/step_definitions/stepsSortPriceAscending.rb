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


	products = driver.find_elements(:class, 'simpleCart_shelfItem')

	prices = []

	for el in products
		price = el.find_element(:class, "item_price")
		# product = el.find_element(:tag_name, "h4")
		# log(el)
		# log(product.text)
		priceText = price.text
		priceText.slice! '$'
		prices.push(priceText.to_f)
		# log(price.text)
	end

	log(prices)
	sortedPrices = prices.sort
	log("sortedPrices:", sortedPrices)

    expect(prices).to eq(sortedPrices)                      # validate items equal 

	
end