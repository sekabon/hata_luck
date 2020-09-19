class HomeController < ApplicationController
  before_action :authenticate_user!, only: :authentication
  def index
    @user = User.all
  end


  def authentication
  end
end
