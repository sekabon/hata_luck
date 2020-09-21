class ShiftsController < ApplicationController
  def index
    @user = User.all
    @shift = Shift.all
  end
  def new
    @shift = Shift.new
  end
  def create
    @shift = Shift.new(shift_params)
    if @shift.valid?
      @shift.save
      redirect_to root_path
    else
      render :new
    end
  end
  private
  def shift_params
    params.permit(:work_day, :start_time, :end_time, :break_start, :break_end).merge(user_id: current_user.id)
  end
end
