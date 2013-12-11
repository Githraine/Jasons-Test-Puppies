require_relative 'error_panel'
require_relative 'side_menu_panel'

class LoginPage
 include PageObject
 include SideMenuPanel
 include ErrorPanel

 text_field(:username, :id => 'name')
 text_field(:password, :id => 'password')
 button(:login, :value => 'Login')

 def login_to_system(username='admin', password='password')
   self.username = username
   self.password = password
   login
 end
end