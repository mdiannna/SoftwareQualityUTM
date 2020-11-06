# Nr 14 pe lista =>  varianta 6 din 8
# Variant 6
# Open 999.md. Search for computer. Check that 999 header is displayed

import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

class Header999(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Chrome()

    def test_search_in_python_org(self):
        driver = self.driver

        driver.get("https://999.md/ro/")

        # 1. Find search element, clear contend and write computer
        elem = driver.find_element_by_name("query")
        elem.clear()
        elem.send_keys("computer")

        # 2. Press enter:
        elem.send_keys(Keys.RETURN)

        # 3. Check if 999 header is displayed
        
        elem_header =   driver.find_element_by_tag_name("header")
        
        # check if header element exists
        assert elem_header is not None

        # check if "999" text is in header
        assert "999" in elem_header.text
        
        # additionally check if element with .header_bar_logo exists - the 999 logo
        elem_header_by_css =   driver.find_element_by_css_selector(".header_bar_logo")
        assert elem_header_by_css is not None


    def tearDown(self):

        # time.sleep(1) #wait 1 second
        self.driver.close()

if __name__ == "__main__":
    unittest.main()