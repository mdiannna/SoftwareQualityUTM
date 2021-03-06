require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
require 'cucumber_priority'


driver = ""

Before('@CommunityPoll') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end


Given("Open Men's clothes page") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end.overridable


Then("Select option 'More colors to choose' from the poll options") do
	for el in driver.find_elements(:class,'check_box')
		log(el.text)
		if el.text == "More colors to choose"
			el.click
		end
	end
end


Then("Submit poll") do
	poll = driver.find_element(:class, "community-poll")
    poll.find_element(:css,'[type="submit"]').click                       # click submit     
end


Then("Check if community poll results submited") do
	
    # check if community poll disappeared from the page - results submited
    poll = driver.find_elements(:class, "community-poll")

    expect(poll.length).to eq(0)
end


After('@CommunityPoll') do
	driver.close()
end