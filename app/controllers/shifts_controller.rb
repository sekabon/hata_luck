class ShiftsController < ApplicationController
  def index
    @user = User.includes(:user)
    @shift = Shift.includes(:user)
  end

  def new
    #@shift = Shift.includes(:user)
    @shift = Shift.new
  end

  def create
    #binding.pry
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def shift_params
    params.require(:shift).permit(:work_day, :start_time, :end_time, :break_start, :break_end).merge(user_id: current_user.id)
  end
end
