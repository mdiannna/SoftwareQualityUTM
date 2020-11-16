require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
# require 'cucumber_priority'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver

Given("Access the page - Men's wear") do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/mens.html"         # direct to site
end
# end.overridable

Then('​​Click on any product') do
	products = driver.find_elements(:class, 'simpleCart_shelfItem')
	# productLink = products[0].find_element(:css, 'a')
	productLink = products[0].find_element(:css, 'h4')
	log("productLink:", productLink.text)

	productLink.click()
	url = driver.current_url()
	log("url:", url)

	expect(url).to eq('https://adoring-pasteur-3ae17d.netlify.app/single.html')
end

Then('Put the cursor of the image of the product in image viewer') do
	# wait to load
	sleep(2)
	# el = driver.find_element(:css, "div[class='imagezoom-cursor']")
	# el = driver.find_element(:class, "imagezoom-cursor")
	el = driver.find_element(:css, ".flex-active-slide")
	img = el.find_element(:css, "img")

	# el = driver.find_element(:css, ".thumb-image")
	log(el)
	src = img.attribute('src')

	log("el image:", src)
	driver.action.move_to(el).perform
end

Then('Move the cursor on the image') do
	el = driver.find_element(:css, ".flex-active-slide")
	# el = driver.find_element(:css, ".thumb-image")

	log(el)
	driver.action.move_to(el, 30, 30).perform
	
	sleep(1)

	driver.action.move_to(el, 20, 20).perform
	sleep(1)

	driver.action.move_to(el, 10, 10).perform
end


srcImg1 = ""
srcImg2 = ""
srcImg3 = ""

Then('​Click on second image from the image slider') do
	el = driver.find_element(:css, ".flex-active-slide")
	img = el.find_element(:css, "img")

	# el = driver.find_element(:css, ".thumb-image")
	log(el)
	srcImg1 = img.attribute('src')


	# ol = driver.find_element(:css, "ol[class='flex-control-thumbs']")
	ol = driver.find_element(:class, "flex-control-thumbs")
	li2 = ol.find_elements(:css, 'li')[1] # al doilea element
	li2.click
	
	sleep(1)

	el = driver.find_element(:css, ".flex-active-slide")
	img = el.find_element(:css, "img")

	# el = driver.find_element(:css, ".thumb-image")
	log(el)
	srcImg2 = img.attribute('src')

	log("srcImg1: ", srcImg1 )
	log("srcImg2: ", srcImg2 )


	expect(srcImg1).not_to eq(srcImg2)
end


Then('Click on the third image from the image slider') do
	
	# ol = driver.find_element(:css, "ol[class='flex-control-thumbs']")
	ol = driver.find_element(:class, "flex-control-thumbs")
	li2 = ol.find_elements(:css, 'li')[2] # al treilea element
	li2.click
	
	sleep(1)

	el = driver.find_element(:css, ".flex-active-slide")
	img = el.find_element(:css, "img")

	# el = driver.find_element(:css, ".thumb-image")
	log(el)
	srcImg3 = img.attribute('src')

	log("srcImg1: ", srcImg1 )
	log("srcImg2: ", srcImg2 )
	log("srcImg3: ", srcImg3 )

	
	expect(srcImg3).not_to eq(srcImg2)
	expect(srcImg3).not_to eq(srcImg1)
end


Then('Click on the first image from the image slider') do
	ol = driver.find_element(:class, "flex-control-thumbs")
	li2 = ol.find_elements(:css, 'li')[0] # primul element
	li2.click
	
	sleep(1)

	el = driver.find_element(:css, ".flex-active-slide")
	img = el.find_element(:css, "img")

	srcNewCompare = img.attribute('src')

	log("srcImg1: ", srcImg1 )
	log("srcNewCompare: ", srcNewCompare )

	expect(srcNewCompare).to eq(srcImg1)
end
