class UsersController < ApplicationController
  def index
    @users = User.order("id")
    @follow = Follow.where(from_id: current_user)
    @follower = Follow.where(to_id: current_user)
  end

  def show
    @user = User.find(params[:id])
    @timetable=Timetable.find(params[:id])
  end

  def destory
  end
end
