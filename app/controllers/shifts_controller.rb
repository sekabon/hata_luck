class ShiftsController < ApplicationController
  def index
    @user = User.all
  end

end
