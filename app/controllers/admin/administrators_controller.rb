class Admin::AdministratorsController < Admin::AdminController
  
  def new
    @administrator = Administrator.new
  end

  def show

  end

  def create
    @administrator = Administrator.new(params[:administrator])
    if @administrator.save
      redirect_to admin_administrator_path, :notice => "Signed up!"
    else
      render "new"
    end
  end
end
