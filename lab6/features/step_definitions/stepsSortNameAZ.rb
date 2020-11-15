require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver


Given("Open Men clothes page") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end


Then('Choose Name\(A - Z) option in the Sort By select') do

	# dropDownMenu = @driver.find_element(:class, 'dropDownMenu')
	dropDownMenu = driver.find_element(:id, 'country1')

	option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
	option.select_by(:text, 'Name(A - Z)')
	# option.select_by(:value, '0')


	# TODO:!!!! Check if results are sorted!!!

	products = driver.find_elements(:class, 'simpleCart_shelfItem')

	product_names = []

	for el in products
		# price = el.find_element(:class, "item_price")
		product = el.find_element(:tag_name, "h4")
		# log(el)
		# log(product.text)
		product_names.push(product.text)
		# log(price.text)
	end

	log(product_names)

end