class Admin::SessionsController < Admin::AdminController

  def new
  end

  def create
    administrator = Administrator.authenticate(params[:email], params[:password])
    if administrator
      session[:administrator_id] = administrator.id
      redirect_to admin_administrators_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
  session[:administrator_id] = nil
  redirect_to "localhost:3000", :notice => "Logged out!"
  end

  private

#   def current_administrator
#     @current_administrator ||= Administrator.find(session[:administrator_id]) if session[:administrator_id]
#   end

#  helper_method :current_administrator

  def authenticate_administrator
    redirect_to admin_log_in_path,
     alert: "you have to log in" if current_administrator.nil?
  end
end
