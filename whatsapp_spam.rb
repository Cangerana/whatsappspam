require "selenium-webdriver"

url = "https://web.whatsapp.com/"
name = "Contact Name"
msg = "Message to sand"
# Number of messagers
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
sleep(10)

# Finding contact
contact = driver.find_element(:xpath, "//span[@title='#{name}']")

# selecting
contact.click

# Time to load corretaly
sleep(2)

# Spam
count_msg.times do
    # Finding the chat box
    chat_box = driver.find_element(:xpath, "/html/body/div[1]/div/div/div[4]/div/footer/div[1]/div[2]/div/div[2]")

    # Selecting
    chat_box.click

    # Putting the message
    chat_box.send_keys(msg)

    sleep(0.3)

    # Finding the send button
    send_button = driver.find_element(:xpath, "/html/body/div[1]/div/div/div[4]/div/footer/div[1]/div[3]")

    # Sennding
    send_button.click

    # time to refresh
    sleep(0.1)
end

# Close browser
driver.close