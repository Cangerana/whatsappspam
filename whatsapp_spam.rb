require "selenium-webdriver"

url = "https://web.whatsapp.com/"
name = "Contact Name"
msg = "Message to sand"
count_msg = 200

# Firefox config
options = Selenium::WebDriver::Firefox::Options.new
options.add_argument("--ignore-certificate-errors")
options.add_argument("--disable-popup-blocking")
options.add_argument('--disable-translate')

# Instance of Firefox
driver = Selenium::WebDriver.for :firefox, options: options

# Open browser
driver.navigate.to(url)

# Time to sacan the QRCode 
sleep(15)

# Close browser
driver.close