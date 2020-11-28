require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = ""

USERNAME = "diana367"
AUTOMATE_KEY = "NmsqJih8tcUphDjkhqqS"
browserstack_url = "https://" + USERNAME + ":" + AUTOMATE_KEY + "@hub-cloud.browserstack.com/wd/hub"

caps = Selenium::WebDriver::Remote::Capabilities.new
        
caps['os'] = 'Windows'
caps['os_version'] = '10'
caps['browser'] = 'Chrome'
caps['browser_version'] = '80'
caps['takesScreenshot'] = true
        
caps['name'] = "Test Google Search"




# Before('@SearchNonExistingData') do
Before('@SearchOnGoogle') do
	# Running on local:
	driver = Selenium::WebDriver.for:chrome

	# Running on browserstack
	# driver = Selenium::WebDriver.for(:remote, :url => browserstack_url, :desired_capabilities => caps)
end


Given('Go to google.com') do
  driver.navigate.to "https://www.google.com/"         # direct to site
end


Then('Write non existing data ++++++ in search input') do
 	search_input = driver.find_element(:class, 'gLFyf')
 	search_input.clear()
 	search_input.send_keys("++++++")
 	sleep(0.4)
end


Then('Click search') do	
 	# search_button = driver.find_element(:css, "input[class='gNO89b']")
 	# search_button.click() 

	driver.find_element(:css,'form').submit()                       # click submit form

 	sleep(0.8)
end


Then('It should not display any results') do
	result = driver.find_element(:id, "res")

	# functioneaza doar pentru google ro
	# expect(result.text()).to include('Căutarea dvs. - ++++++ - nu a returnat niciun document')
	# expect(result.text()).to include('nu a returnat niciun document')

	search_item_results = result.find_elements(:class, "g")
	expect(search_item_results.length).to eq(0)
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

	# Verificam daca nu se afiseaza "Cautarea nu a returnat niciun document" - functioneaza doar pentru google ro
	# expect(result.text()).not_to include('nu a returnat niciun document')

	# Verificam daca sunt mai mult de 0 rezultate la cautare
	search_item_results = result.find_elements(:class, "g")
	expect(search_item_results.length).not_to eq(0)
end


Then('Results should be similar to term "Technical"') do
	# result = driver.find_element(:id, "search")
	result = driver.find_element(:id, "res")

	search_item_results = result.find_elements(:class, "g")
	# search_item_results = result.find_elements(:class, "rspec")

	# Verificam daca primele 5 rezultate contin cuvantul "technical"
	for search_item in search_item_results[1..5]

		log("--- item:", search_item.text())
		if search_item.text() != ""
			expect(search_item.text.downcase).to include('technic')
		end
	end
end


After('@SearchOnGoogle') do
	driver.close()
end