require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver


Given('Access the products page') do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/single.html"         # direct to site
end


Then('Click on tab "Reviews"') do
	ul = driver.find_element(:class, "resp-tabs-list")
	lis = ul.find_elements(:class, "resp-tab-item")
	
	for li in lis 
		# log(li.text.downcase)
		
		if li.text.downcase=='reviews'
			li.click()
		end
	end

	sleep(1)
	# tabContainer = driver.find_element(:class, "single_page_agile_its_w3ls")
	# tabContainer = driver.find_element(:class, "single_page_agile_its_w3ls")
	# tabContainer = driver.find_element(:css, "div[class='resp-tab-content-active']")
	tabContainer = driver.find_element(:class, "resp-tab-content-active")

	# log("tabContainer text:", tabContainer.text)
	# addReview = tabContainer.find_element(:css, "div[class='add-review']")
	addReview = tabContainer.find_element(:css, "h4")
	log("addReview text:", addReview.text)

	# check if text "add a review is present in the active tab"
	expect(addReview.text.downcase).to eq('add a review')
end


Then('Write name in the field "Name" (first field)') do
	pending
end

Then('Negative test - write the email without @ in the email field and press enter') do
	pending
end

Then('Write the correct email in the field "Email" (first field)') do
	pending
end

Then('Write the review in the textarea') do
	pending
end

Then('Click on "SEND" button') do
	pending
end
