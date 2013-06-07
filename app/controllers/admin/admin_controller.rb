class Admin::AdminController < ApplicationController

  helper_method :current_administrator

 private

   def current_administrator
     @current_administrator ||= Administrator.find(session[:administrator_id]) if session[:administrator_id]
   end

end
