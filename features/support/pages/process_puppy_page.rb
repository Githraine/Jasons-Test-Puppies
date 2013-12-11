require_relative 'error_panel'
require_relative 'side_menu_panel'

class ProcessPuppyPage
  include PageObject
  include ErrorPanel
  include SideMenuPanel

  def process_first_puppy
    button_element(:value => 'Process Puppy').click
  end
end