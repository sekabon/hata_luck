class UsersController < ApplicationController
  def new
    @shift = Shift.new
  end
end
