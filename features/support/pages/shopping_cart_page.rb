require_relative 'side_menu_panel'
require_relative 'error_panel'

class ShoppingCartPage
  include PageObject
  include SideMenuPanel
  include ErrorPanel

  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3
  LINES_PER_PUPPY = 6

  button(:proceed_to_checkout, :value => "Complete the Adoption")
  button(:continue_shopping, :value => "Adopt Another Puppy")
  table(:cart, :index => 0)
  cell(:cart_total, :class => "total_cell")

  def name_for_record(record)
   table_value(record, NAME_COLUMN)
  end

  def subtotal_for_record(record)
   table_value(record, SUBTOTAL_COLUMN)
  end

  private

  def table_value(record, column)
   row = (record.to_i - 1) * LINES_PER_PUPPY
   cart_element[row][column].text
  end

end