require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = ""

Before('@ProductReviewFunctionality') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end


Given('Access the products page') do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/single.html"         # direct to site
end


Then('​Click on tab Reviews') do
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


Then('Write name in the field "Name" \(first field)') do
	sleep(1)
	driver.execute_script("window.scrollTo(0, window.scrollY + 500)")
	sleep(2)

	tabContainer = driver.find_element(:class, "resp-tab-content-active")

    elem = tabContainer.find_element(:name, "Name")
    elem.clear()
    elem.send_keys("Test name")
end

Then('Negative test - write the email without @ in the email field and press enter') do
	input = driver.find_element(:css, "input[name='Name']")

	sleep(1)
	driver.execute_script("window.scrollTo(0, window.scrollY + 500)")
	sleep(2)

	tabContainer = driver.find_element(:class, "resp-tab-content-active")

    elem = tabContainer.find_element(:name, "Email")
    elem.click()
    elem.clear()
    elem.send_keys("Bad email")
    elem.send_keys(:return)

    message = elem.attribute("validationMessage")
    log("message:", message)

    # asteptam sa apara eroarea care contine ceva cu email adress 
    expect(message.downcase).to include('email address')
    # asteptam sa apara eroarea care contine ceva cu @
    expect(message.downcase).to include('@')
    # asteptam sa apara eroarea care contine ceva cu missing
    expect(message.downcase).to include('missing')
end


Then('​Write the correct email in the field Email \(first field)') do
	input = driver.find_element(:css, "input[name='Name']")

	sleep(1)
	driver.execute_script("window.scrollTo(0, window.scrollY + 500)")
	sleep(2)

	tabContainer = driver.find_element(:class, "resp-tab-content-active")

    elem = tabContainer.find_element(:name, "Email")
    elem.click()
    elem.clear()
    elem.send_keys("test@test.com")
    elem.send_keys(:return)

    message = elem.attribute("validationMessage")
    log("message:", message)

    # asteptam sa nu apara erori
    expect(message.downcase).to eq("")
end


Then('Write the review in the textarea') do
	tabContainer = driver.find_element(:class, "resp-tab-content-active")

    elem = tabContainer.find_element(:name, "Message")
    elem.clear()
    elem.send_keys("Test This is my review")
    sleep(1)
end


Then('​Click on SEND button') do
	tabContainer = driver.find_element(:class, "resp-tab-content-active")
	s = tabContainer.find_element(:css,'form').submit()                       # click submit form

	sleep(2)

	page_text = driver.find_element(:css, "body").text()
	expect(page_text.downcase).not_to include("page not found")
end


After('@ProductReviewFunctionality') do
	driver.close()
end