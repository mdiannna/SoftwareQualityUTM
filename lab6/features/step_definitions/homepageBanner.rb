require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = ""

Before('@HomepageBanner') do
	driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver
end



Given('Access homepage') do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/index.html"         # direct to site
end


Then('Click on right arrow on the banner') do
	slider = driver.find_element(:css, ".carousel-inner")
	# slider = slider.find_element(:css, "div[class='item active']")
	slider = slider.find_element(:css, ".active")

	slideCaption1 = slider.find_element(:css, ".carousel-caption").find_element(:css, "h3")
	log("Slide 1 caption:", slideCaption1.text)

	# click on right arrow
    driver.find_element(:css, "a[class='right carousel-control']").click()

    sleep(1)

	slider = driver.find_element(:css, ".carousel-inner")
	# slider = slider.find_element(:css, "div[class='active']")
	slider = slider.find_element(:css, ".active")

    # slideCaption2 = slider.find_element(:css, ".carousel-caption").find_element(:css, "h3").text
    # slideCaption2 = slider.find_element(:css, ".carousel-caption").text
    slideCaption2 = slider.find_element(:css, ".carousel-caption").find_element(:css, "p")
	# slideCaption2 = slider.find_element(:css, ".carousel-caption")

	log("Slide 2 caption:", slideCaption2.text)

	# check if slide changed
    expect(slideCaption1.text).not_to eq(slideCaption2.text)
end


Then('Click on left arrow on the banner') do
	slider = driver.find_element(:css, ".carousel-inner")
	slider = slider.find_element(:css, ".active")
	

	slideCaption1 = slider.find_element(:css, ".carousel-caption").find_element(:css, "h3")
	log("Slide 1 caption:", slideCaption1.text)

	# click on left arrow
	driver.find_element(:css, "a[class='left carousel-control']").click()

    sleep(1)

	slider = driver.find_element(:css, ".carousel-inner")
	# slider = slider.find_element(:css, "div[class='active']")
	slider = slider.find_element(:css, ".active")

    # slideCaption2 = slider.find_element(:css, ".carousel-caption").find_element(:css, "h3").text
    # slideCaption2 = slider.find_element(:css, ".carousel-caption").text
    slideCaption2 = slider.find_element(:css, ".carousel-caption").find_element(:css, "p")
	# slideCaption2 = slider.find_element(:css, ".carousel-caption")

	log("Slide 2 caption:", slideCaption2.text)

	# check if slide changed
    expect(slideCaption1.text).not_to eq(slideCaption2.text)
end


Then('Click on circles on the banner') do
	slider = driver.find_element(:css, ".carousel-inner")
	# slider = slider.find_element(:css, "div[class='item active']")
	slider = slider.find_element(:css, ".active")
	

	slideCaption1 = slider.find_element(:css, ".carousel-caption").find_element(:css, "h3")
	log("Slide 1 caption:", slideCaption1.text)

	# click on circles
  	ol_indicators = driver.find_element(:css, "ol[class='carousel-indicators']")
  	ol_indicators.find_element(:css, "li").click()
   
    sleep(1)

	slider = driver.find_element(:css, ".carousel-inner")
	# slider = slider.find_element(:css, "div[class='active']")
	slider = slider.find_element(:css, ".active")

    # slideCaption2 = slider.find_element(:css, ".carousel-caption").find_element(:css, "h3").text
    # slideCaption2 = slider.find_element(:css, ".carousel-caption").text
    slideCaption2 = slider.find_element(:css, ".carousel-caption").find_element(:css, "p")
	# slideCaption2 = slider.find_element(:css, ".carousel-caption")

	log("Slide 2 caption:", slideCaption2.text)

	# check if slide changed
    expect(slideCaption1.text).not_to eq(slideCaption2.text)
end


After('@HomepageBanner') do
	driver.close()
end
