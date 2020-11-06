# Nr 14 pe lista =>  varianta 6 din 8
# Variant 6
# Open 999.md. Search for computer. Check that 999 header is displayed

from selenium import webdriver
from selenium.webdriver.common.keys import Keys

import time
#Simple assignment
from selenium.webdriver import Chrome

driver = Chrome()

#Or use the context manager
# from selenium.webdriver import Chrome

# with Chrome() as driver:


# driver = webdriver.Firefox()

driver.get("https://999.md/ro/")

# assert "Python" in driver.title
# gasim elementul de search, stergem ce e acolo si pe urma cautam computer
# elem = driver.find_element_by_name("q")
elem = driver.find_element_by_name("query")
elem.clear()
elem.send_keys("computer")
elem.send_keys(Keys.RETURN)

assert "999" not in driver.page_source

time.sleep(5) #wait 5 seconds
driver.close()