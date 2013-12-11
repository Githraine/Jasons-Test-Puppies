# Home
Given /^I am on the puppy adoption site$/ do
  visit(HomePage)
end

When /^I click the View Details button for "(.*?)"$/ do |name|
 on(HomePage).select_puppy name
 end

# Details

When /^I click the Adopt Me button$/ do
  on(DetailsPage).add_to_cart
end

#Checkout

When /^I complete the adoption using a Credit card$/ do
 on(CheckoutPage).checkout('pay_type' => 'Credit card')
end

When /^I complete the adoption$/ do
 on(CheckoutPage).checkout
end

When /^I enter "([^\"]*)" in the name field$/ do |name|
  on(CheckoutPage).name = name
end

When /^I enter "([^\"]*)" in the address field$/ do |address|
  on(CheckoutPage).address = address
end

When /^I enter "([^\"]*)" in the email field$/ do |email|
  on(CheckoutPage).email = email
end

When /^I select "([^\"]*)" from the pay with dropdown$/ do |pay_type|
  on(CheckoutPage).pay_type = pay_type
end

When /^I click the Place Order button$/ do
  on(CheckoutPage).place_order
end

When /^I checkout leaving the name field blank/ do
  navigate_to(CheckoutPage).checkout('name' => '')
end

#Shopingcart

When /^I click the Adopt Another Puppy button$/ do
  on(ShoppingCartPage).continue_shopping
end

When /^I click the Complete the Adoption button$/ do
  on(ShoppingCartPage).proceed_to_checkout
end

Then /^I should see "([^\"]*)" as the name for record (\d+)$/ do |name, record|
  #row = row_for(record.to_i)
  #@browser.table(:index => 0)[row][1].text.should include name
  #cart_line_item(record.to_i)[1].text.should include name
  on(ShoppingCartPage).name_for_record(record).should include name
  # i really hate using indexes....
end

Then /^I should see "([^"]*)" as the subtotal for record (\d+)$/ do |subtotal,record|
  on(ShoppingCartPage).subtotal_for_record(record).should == subtotal
end

Then /^I should see "([^"]*)" as the transaction total$/ do |total|
  on(ShoppingCartPage).cart_total.should == total
end

#general

Given /^I have a pending adoption for "([^"]*)"$/ do |name|
  navigate_to(CheckoutPage).checkout('name' => name)
end

When /^I complete the adoption of a puppy$/ do
  navigate_all
end

When /^I process that adoption$/ do
  visit(LandingPage)
  on(LoginPage).login_to_system
  on(LandingPage).adoptions
  on(ProcessPuppyPage).process_first_puppy
end

Then /^I should see "([^\"]*)"$/ do |expected|
  @current_page.text.should include expected
end

Then /^I should see the error message "([^"]*)"$/ do |msg|
  @current_page.should have_error_message msg
end
