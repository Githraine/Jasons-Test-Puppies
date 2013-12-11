require_relative 'side_menu_panel'
require_relative 'error_panel'

class DetailsPage
 include PageObject
 include SideMenuPanel
 include ErrorPanel

 button(:add_to_cart, :value => 'Adopt Me!')
end