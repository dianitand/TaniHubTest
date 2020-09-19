require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome


Given(/^Open TaniHub "(.*?)"$/) do |tanihub|
    driver.manage.window.maximize
    driver.navigate.to tanihub
end

Then("Choose Location") do
    driver.find_element(:xpath, '//*[@id="navbarBasicExample"]/div[1]/div[1]/div/div[2]/div/div[2]/section/div/div[5]/div[1]/label/div[1]/div/p[1]').click
end

Then("Click Masuk") do
    driver.find_element(:xpath, '//*[@id="navbarBasicExample"]/div[2]/div[2]/div').click
end

Then(/^Login with Email "(.*?)"$/) do |email|
    driver.find_element(:xpath, '//*[@id="navbarBasicExample"]/div[2]/div[2]/div/div[1]/div/div[2]/section/form/div[2]/span/input').send_keys(email)
    driver.find_element(:xpath, '//*[@id="navbarBasicExample"]/div[2]/div[2]/div/div[1]/div/div[2]/section/form/div[3]/button').click
    sleep(2)
end

And(/^Password "(.*?)"$/) do |password|
    driver.find_element(:xpath, '//*[@id="navbarBasicExample"]/div[2]/div[2]/div/div[1]/div/div[2]/section/form/div[3]/div/input').send_keys(password)
end

Then("Login") do
    driver.find_element(:xpath, '//*[@id="navbarBasicExample"]/div[2]/div[2]/div/div[1]/div/div[2]/section/form/div[5]/button').click
    sleep(2)
end

Given(/^Product "(.*?)"$/) do |product|
    elprod = driver.find_element(:xpath, '//*[@id="navbarBasicExample"]/div[1]/div[2]/div/div[1]/div[1]/div[2]/input')
    elprod.send_keys(product)
    elprod.send_keys:return
    sleep(2)
end

And("Select First Product to Add To Cart") do
    driver.find_element(:xpath, '//*[@id="__next"]/div/div[2]/div/div/div[1]/div/div[2]/div/div/div[2]/div[1]/div[1]/div/div[2]/div[2]/button').click
    sleep(2)
end

Then("Checkout") do
    driver.find_element(:xpath, '//*[@id="__next"]/div/div[2]/div/div/div[2]/div/div/div[4]/div[2]/div/button').click
    sleep(2)
end

Then("Select Address") do
    driver.find_element(:xpath, '//*[@id="__next"]/div/div[2]/div/div[2]/div[1]/div[2]/div/div[2]/div/button').click
    sleep(3)
    driver.find_element(:xpath, '//*[@id="__next"]/div/div[2]/div/div[2]/div[1]/div[2]/div/div[2]/div/div[1]/div/div[2]/section/div/div[3]/div/div[3]/button').click
end

Then(/^Select VA Payment Method "(.*?)"$/) do |pay|
    driver.find_element(:xpath, '//*[@id="__next"]/div/div[2]/div/div[2]/div[2]/div/div[6]/div[3]').click
    driver.find_element(:xpath, '//*[@id="__next"]/div/div[2]/div/div[2]/div[2]/div/div[6]/div[3]/div/div/div/div/div[1]/button').click
    driver.find_element(:xpath, "//button[contains(., '"+pay+"')]").click
    sleep(2)
end

Then("Proceed to Payment") do
    driver.find_element(:xpath, '//*[@id="__next"]/div/div[2]/div/div[2]/div[2]/div/div[6]/button').click
end

And("Wait Until VA number appear") do
    sleep(10)
end



