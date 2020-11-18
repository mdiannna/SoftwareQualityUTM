require 'selenium-webdriver'
require 'rubygems'
require 'rspec'


driver = ""

Before('@TabsFunctionality') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end


Given('Access products page') do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/single.html"         # direct to site
end


Then('Click on "Reviews" tab') do
	ul = driver.find_element(:class, "resp-tabs-list")
	lis = ul.find_elements(:class, "resp-tab-item")
	
	for li in lis 
		if li.text.downcase=='reviews'
			li.click()
		end
	end

	sleep(1)

	tabContainer = driver.find_element(:class, "resp-tab-content-active")

	addReview = tabContainer.find_element(:css, "h4")
	log("addReview text:", addReview.text)

	# check if text "add a review is present in the active tab"
	expect(addReview.text.downcase).to eq('add a review')
end

Then('Click on "Information" tab') do
	ul = driver.find_element(:class, "resp-tabs-list")
	lis = ul.find_elements(:class, "resp-tab-item")
	
	for li in lis 
		if li.text.downcase=='information'
			li.click()
		end
	end

	sleep(1)

	tabContainer = driver.find_element(:class, "resp-tab-content-active")

	productName = tabContainer.find_element(:css, "h6")
	log("Product name text:", productName.text)

	expect(productName.text.downcase).to eq('Big Wing Sneakers (Navy)'.downcase)
end


Then('Click on "Description" tab') do
	ul = driver.find_element(:class, "resp-tabs-list")
	lis = ul.find_elements(:class, "resp-tab-item")
	
	for li in lis 
		if li.text.downcase=='description'
			li.click()
		end
	end

	sleep(1)
	tabContainer = driver.find_element(:class, "resp-tab-content-active")

	title = tabContainer.find_element(:css, "h6")
	log("Product name text:", title.text)

	expect(title.text.downcase).to eq('LOREM IPSUM DOLOR SIT AMET'.downcase)
end


Then('Click on "Information" tab again') do
	ul = driver.find_element(:class, "resp-tabs-list")
	lis = ul.find_elements(:class, "resp-tab-item")
	
	for li in lis 
		if li.text.downcase=='information'
			li.click()
		end
	end

	sleep(1)
	tabContainer = driver.find_element(:class, "resp-tab-content-active")

	productName = tabContainer.find_element(:css, "h6")
	log("Product name text:", productName.text)

	# check if text "add a review is present in the active tab"
	expect(productName.text.downcase).to eq('Big Wing Sneakers (Navy)'.downcase)
end


After('@TabsFunctionality') do
	driver.close()
end