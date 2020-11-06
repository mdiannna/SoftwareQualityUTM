# Nr 14 pe lista =>  varianta 6 din 8
# Variant 6
# Open 999.md. Search for computer. Check that 999 header is displayed


import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

class PythonOrgSearch(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Chrome()

    def test_search_in_python_org(self):
        driver = self.driver

        driver.get("https://999.md/ro/")

        # assert "Python" in driver.title
        # gasim elementul de search, stergem ce e acolo si pe urma cautam computer
        # elem = driver.find_element_by_name("q")
        elem = driver.find_element_by_name("query")
        elem.clear()
        elem.send_keys("computer")
        elem.send_keys(Keys.RETURN)

        # TODO: check 999 header is displayed
#         .header_bar_logo a {
#     position: relative;
#     background: url(/static/classic/assets/i/logo.svg?1);
#     -webkit-background-size: 100px 64px;
#     -moz-background-size: 100px 64px;
#     background-size: 100px 64px;
# }
        # print(driver.page_source)
        # assert "999" not in driver.page_source
        # self.assertNotIn("999", driver.page_source)

        elem_header =   driver.find_element_by_tag_name("header")
        # print("elem header:")
        # print(elem_header)

        assert elem_header is not None
        
        assert "999" in elem_header.text
        # self.assertIn("999", elem_header.text)
        
        elem_header_by_css =   driver.find_element_by_css_selector(".header_bar_logo")
        assert elem_header_by_css is not None

        # elem_header.value_of_css_property(property_name)

        # self.assertIn("999", driver.page_source)
        # self.assertIn(".header_bar_logo", driver.page_source)
        # assert ".header_bar_logo" in driver.page_source
        # self.assertIn(".header_bar_logo",driver.page_source)


    def tearDown(self):

        time.sleep(1) #wait 1 second
        # driver.close()
        self.driver.close()

if __name__ == "__main__":
    unittest.main()