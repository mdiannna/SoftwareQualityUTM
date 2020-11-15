require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver


Given("Open men's clothes webpage") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end


# Then("Choose Price(Low-High) option in the Sort By select") do
Then('Choose Price\(High-Low) option in the Sort By select') do

	# dropDownMenu = @driver.find_element(:class, 'dropDownMenu')
	dropDownMenu = driver.find_element(:id, 'country1')

	option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
	option.select_by(:text, 'Price(High - Low)')
	# option.select_by(:value, 'Price(High - Low)')
	# option.select_by(:value, '0')

	# sleep(3)
	
	products = []
	products = driver.find_elements(:class, 'simpleCart_shelfItem')
	log("products:", products)

	prices = []
	pricesWithCoords = []


	products.each do |el|

    	price = el.find_element(:class, "item_price")
		# product = el.find_element(:tag_name, "h4")
		# log(el)
		# log("location:", "x:", el.location.x, " y:", el.location.y)
		priceText = price.text
		priceText.slice! '$'
		log(priceText)
		# prices.push(priceText.to_f)
		x = el.location.x
		y = el.location.y

		log("x:", x)

		temp = {
			"price": priceText.to_f,
			"x": x.to_f,
			"y": y.to_f
		}

		prices.push(priceText.to_f)
		pricesWithCoords.push(temp)
		
		# log(price.text)
	end  

	# for el in products
	# 	price = el.find_element(:class, "item_price")
	# 	# product = el.find_element(:tag_name, "h4")
	# 	# log(el)
	# 	priceText = price.text
	# 	priceText.slice! '$'
	# 	log(priceText)
	# 	prices.push(priceText.to_f)
	# 	# log(price.text)
	# end


	# sortedPricesInOrder = pricesWithCoords.sort { |a, b| [a['y'], a['x']] <=> [b['y'], b['x']] }
	# sortedPricesInOrder = pricesWithCoords.sort_by { |a| a[:y]} #works
	sortedPricesInOrder = pricesWithCoords.sort_by { |a| [a[:y], a[:x]]}
	# sortedPricesInOrder = pricesWithCoords.sort_by{ |h| [h['y']] }
	# sortedPricesInOrder = pricesWithCoords.sort_by{ |h| [h['y'],h['x']] }
	# sortedPricesInOrder = pricesWithCoords.sort_by{ |a,b| [a['y'] <=> b['y'], a['x'] <=> b['x']] }
	log("sortedPricesInOrder", sortedPricesInOrder)

	log("-------")
	for el in sortedPricesInOrder
		log(el[:price])
	end
	log("-------")
	# sortedPricesInOrder = sortedPricesInOrder.tap { |hs| hs.delete(:y) }
	# sortedPricesInOrder = sortedPricesInOrder.tap { |hs| hs.delete(:x) }
	# log("sortedPricesInOrder", sortedPricesInOrder)

	

	sortedPricesDescending = prices.sort.reverse
	log("sortedPricesDescending:", sortedPricesDescending)

    expect(sortedPricesInOrder).to eq(sortedPricesDescending)


end