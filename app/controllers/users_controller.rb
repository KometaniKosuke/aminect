class UsersController < ApplicationController
  def index
    @users = User.order("id")
  end

  def show
    @user = User.find(params[:id])
    @timetable=Timetable.find(params[:id])
  end

  def destory
  end
end
