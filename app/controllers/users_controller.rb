class UsersController < ApplicationController
  def new
    @shift = Shift.new
  end
  
  def destroy
    shift = Shift.find(params[:id])
    if shift.destroy
      redirect_to new_user_path, notice: "予定を取消しました！"     
    else
      render :new
    end
  end
  def edit
    @shift = Shift.find(params[:id])
  end
  

end
