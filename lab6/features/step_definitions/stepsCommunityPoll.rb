require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver


Given("open men's clothes page") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end


Then("Select option 'More colors to choose' from the poll options") do
	# driver.find_element(:css,'.check_box').click
	# driver.find_element(tag_name:'More colors to choose')
	# elem = driver.find_element(:class,'check_box')
	for el in driver.find_elements(:class,'check_box')
		log(el.text)
		if el.text == "More colors to choose"
			el.click
		end
	end

	# driver.find_element(:css,'[type="radio"]').click                      
	# driver.find_element(:css,'.swit form').choose()


	# elem = driver.find_element(tag_name:'label')
	log("Step2!")

    sleep(1)                                                                # sleep/pause 2 second
end


# 3.Press "Send" Button
Then("validate result community poll") do
    driver.find_element(:css,'[type="submit"]').click                       # click submit 


    sleep(1)                                                                # sleep/pause 2 second
end