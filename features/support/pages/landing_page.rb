require_relative 'side_menu_panel'
require_relative 'error_panel'

class LandingPage
  include PageObject
  include SideMenuPanel
  include ErrorPanel

  page_url 'http://puppies.herokuapp.com/admin'
end