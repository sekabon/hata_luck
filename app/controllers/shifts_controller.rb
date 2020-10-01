class ShiftsController < ApplicationController
  def index
    @user = User.includes(:user)
    @shift = Shift.includes(:user)
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save  
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @shift = Shift.includes(:user)
  end

  private

  def shift_params
    params.require(:shift).permit(:work_day, :start_time, :end_time, :break_start, :break_end).merge(user_id: current_user.id)
  end
end
