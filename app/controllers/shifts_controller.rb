class ShiftsController < ApplicationController

  def index
    @user = User.includes(:user)
    @shift = Shift.includes(:user)
  end


  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to new_user_path, notice: "予定を登録しました！"
    else
      render "users/new"
    end
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update(shift_params)
      redirect_to new_user_path, notice: "予定を変更しました！" 
    else 
      render "users/edit"
    end
  end

  def show
    @shift = Shift.includes(:user)
    unless user_signed_in? && current_user.admin?
      render :index
    end
  end

  private

  def shift_params
    params.require(:shift).permit(:work_day, :start_time, :end_time, :break_start, :break_end).merge(user_id: current_user.id)
  end
end
