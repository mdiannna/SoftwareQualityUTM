require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = ""

# Before('@SearchNonExistingData') do
Before('@SearchOnGoogle') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end


Given('Go to google.com') do
  driver.navigate.to "https://www.google.com/"         # direct to site
end

Then('Write non existing data ++++++ in search input') do
 	search_input = driver.find_element(:class, 'gLFyf')
 	search_input.clear()
 	search_input.send_keys("++++++")
 	sleep(1)
end

Then('Click search') do	
 	# search_button = driver.find_element(:css, "input[class='gNO89b']")
 	# # search_button = driver.find_element(:css, "input[area-label='Căutare Google']")
 	# search_button.click()

	driver.find_element(:css,'form').submit()                       # click submit form

 	sleep(2)
end

Then('It should not display any results') do
	# result = driver.find_element(:css, "div[class='mw']")
	result = driver.find_element(:id, "res")

	# expect(result.text()).to include('Căutarea dvs. - ++++++ - nu a returnat niciun document')
	expect(result.text()).to include('nu a returnat niciun document')
end


Then('Write word "Technical" in search input') do
	search_input = driver.find_element(:class, 'gLFyf')
 	search_input.clear()
 	search_input.send_keys("Technical")
 	sleep(1)
end

Then('It should display results for "Technical" word search') do
	# merge si cu res si cu search
	result = driver.find_element(:id, "res")
	# search = driver.find_element(:id, "search")

	log("search text:", result.text())

	# Verificam daca nu se afiseaza "Cautarea nu a returnat niciun document"
	expect(result.text()).not_to include('nu a returnat niciun document')

	# Verificam daca sunt mai mult de 0 rezultate la cautare
	search_item_results = result.find_elements(:class, "g")
	expect(search_item_results.length).not_to eq(0)
end

Then('Results should be similar to term "Technical"') do
	result = driver.find_element(:id, "res")

	search_item_results = result.find_elements(:class, "g")

	# Verificam daca primele 5 rezultate contin cuvantul "technical"
	for search_item in search_item_results[0..5]
		expect(search_item.text.downcase).to include('technical')
	end
end

After('@SearchOnGoogle') do
	driver.close()
end