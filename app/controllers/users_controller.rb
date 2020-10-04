class UsersController < ApplicationController
  def new
    @shift = Shift.new
  end
  
  def destroy
    shift = Shift.find(params[:id])
    if shift.destroy
      redirect_to root_path    
    else
      render :new
    end
  end
  def edit
    @shift = Shift.find(params[:id])
  end
  

end
