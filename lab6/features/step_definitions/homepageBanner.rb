require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome                                     # webdriver with chromedriver



Given('Access homepage') do
  driver.navigate.to "https://adoring-pasteur-3ae17d.netlify.app/index.html"         # direct to site
end

Then('Click on right arrow on the banner') do
    driver.find_element(:css, "a[class='right carousel-control']").click()
   TODO: check if slide changed
end

Then('Click on left arrow on the banner') do
  driver.find_element(:css, "a[class='left carousel-control']").click()
   TODO: check if slide changed

end

Then('Click on circles on the banner') do

  ol_indicators = driver.find_element(:css, "ol[class='carousel-indicators']")
  ol_indicators.find_element(:css, "li").click()
    # TODO: check if slide changed
end
