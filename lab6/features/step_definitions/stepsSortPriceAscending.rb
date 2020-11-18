require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = ""

Before('@SortMensWear') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end

# Before('@sortPriceAscending') do
# 	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
# end

Given("Open men clothes page") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end


# Then("Choose Price(Low-High) option in the Sort By select") do
Then('Choose Price\(Low-High) option in the Sort By select') do

	# dropDownMenu = driver.find_element(:class, 'dropDownMenu')
	dropDownMenu = driver.find_element(:id, 'country1')

	option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
	option.select_by(:text, 'Price(Low - High)')
	# option.select_by(:value, '0')

	sleep(1)
	
	products = driver.find_elements(:class, 'simpleCart_shelfItem')

	prices = []
	pricesWithCoords = []


	products.each do |el|

    	price = el.find_element(:class, "item_price")

		priceText = price.text
		priceText.slice! '$'

		log(priceText)

		x = el.location.x
		y = el.location.y

		temp = {
			"price": priceText.to_f,
			"x": x.to_f,
			"y": y.to_f
		}

		prices.push(priceText.to_f)
		pricesWithCoords.push(temp)
	end  


	sortedPricesInOrder = pricesWithCoords.sort_by { |a| [a[:y], a[:x]]}
	log("sortedPricesInOrder", sortedPricesInOrder)

	sortedPricesInOrderValues = []
	log("-------")
	for el in sortedPricesInOrder
		log(el[:price])
		sortedPricesInOrderValues.push(el[:price])
	end
	log("-------")

	

	sortedPricesAscending = prices.sort
	log("sortedPricesAscending:", sortedPricesAscending)

    expect(sortedPricesInOrderValues).to eq(sortedPricesAscending)
	
end

# driver.close()

After('@SortMensWear') do
# After('@sortPriceAscending') do
	driver.close()
end