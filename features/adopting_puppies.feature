Feature: Adopting puppies
  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture

Background:
  Given I am on the puppy adoption site


 Scenario Outline: Adopting one puppy
   When I click the View Details button for "Brook"
   And I click the Adopt Me button
   And I click the Complete the Adoption button
   And I enter "<name>" in the name field
   And I enter "<address>" in the address field
   And I enter "<email>" in the email field
   And I select "<pay_type>" from the pay with dropdown
   And I click the Place Order button
   Then I should see "Thank you for adopting a puppy!"

 Examples:
  | name | address | email | pay_type |
  | Cheezy | 123 Main St | cheezy@example.com| Credit card |
  | Joseph | 555 South St| joe@guru.com | Check |
  | Jared | 234 Leandog | doc@dev.com | Purchase order|


  Scenario: Adopting two puppies
   When I click the View Details button for "Brook"
   And I click the Adopt Me button
   And I click the Adopt Another Puppy button
   And I click the View Details button for "Hanna"
   And I click the Adopt Me button
   And I click the Complete the Adoption button
   And I enter "Cheezy" in the name field
   And I enter "123 Main Street" in the address field
   And I enter "cheezy@example.com" in the email field
   And I select "Credit card" from the pay with dropdown
   And I click the Place Order button
   Then I should see "Thank you for adopting a puppy!"


Scenario: Verify the shopping cart with one puppy
 When I click the View Details button for "Brook"
 And I click the Adopt Me button
 Then I should see "Brook" as the name for record 1
 And I should see "$34.95" as the subtotal for record 1
 And I should see "$34.95" as the transaction total


Scenario: Verify the shopping cart with two puppies
 When I click the View Details button for "Brook"
 And I click the Adopt Me button
 And I click the Adopt Another Puppy button
 And I click the View Details button for "Hanna"
 And I click the Adopt Me button
 Then I should see "Brook" as the name for record 1
 And I should see "$34.95" as the subtotal for record 1
 And I should see "Hanna" as the name for record 2
 And I should see "$22.99" as the subtotal for record 2
 And I should see "$57.94" as the transaction total

Scenario: Adopting a puppy using partial default data
   When I click the View Details button for "Brook"
   And I click the Adopt Me button
   And I click the Complete the Adoption button
   And I complete the adoption using a Credit card
   Then I should see "Thank you for adopting a puppy!"

Scenario: Adopting a puppy using all default data
   When I click the View Details button for "Brook"
   And I click the Adopt Me button
   And I click the Complete the Adoption button
   And I complete the adoption
   Then I should see "Thank you for adopting a puppy!"

Scenario: Thank you message should be displayed
   When I complete the adoption of a puppy
   Then I should see "Thank you for adopting a puppy!"

Scenario: Name is a required field
 When I checkout leaving the name field blank
 Then I should see the error message "Name can't be blank"

#---------------------------------------------------------

#Scenario: Message is displayed when adoption is processed
#  When I process the first pending Adoption
#  Then I should see the Thank you for ordering message


Scenario: Verify message when adoption is processed
  Given I have a pending adoption for "Jason Koelewyn"
  When I process that adoption
  Then I should see "Please thank Jason Koelewyn for the order!"