require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = ""

Before('@SortMensWear') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end

Given("Open page men's clothes") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end


Then('Choose Name\(Z - A) option in the Sort By select') do

	# dropDownMenu = driver.find_element(:class, 'dropDownMenu')
	dropDownMenu = driver.find_element(:id, 'country1')

	option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
	option.select_by(:text, 'Name(Z - A)')
	# option.select_by(:value, '0')

	sleep(1)
	

	products = []
	products = driver.find_elements(:class, 'simpleCart_shelfItem')
	log("products:", products)

	names = []
	namesWithCoords = []

	products.each do |el|

		product = el.find_element(:tag_name, "h4")
		productText = product.text

		x = el.location.x
		y = el.location.y

		temp = {
			"name": productText,
			"x": x.to_f,
			"y": y.to_f
		}

		names.push(productText)
		namesWithCoords.push(temp)
	end  


	sortedNamesInOrder = namesWithCoords.sort_by { |a| [a[:y], a[:x]]}
	log("sortedNamesInOrder", sortedNamesInOrder)

	sortedNamesInOrderValues = []
	log("-------")
	for el in sortedNamesInOrder
		log(el[:name])
		sortedNamesInOrderValues.push(el[:name])
	end
	log("-------")
	

	sortedNamesDescending = names.sort.reverse
	log("sortedNamesDescending:", sortedNamesDescending)

    expect(sortedNamesInOrderValues).to eq(sortedNamesDescending)
end

# driver.close()

After('@SortMensWear') do
	driver.close()
end