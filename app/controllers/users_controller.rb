class UsersController < ApplicationController
  before_action :login_required, except: [:create]
  def index
    @users = User.order("id")
    @follow = Follow.where(from_id: current_user)
    @follower = Follow.where(to_id: current_user)
  end

  def show
    @user = User.find(params[:id])
    @timetable=Timetable.find(params[:id])
    @tags = @user.tags
    @posts = @user.posts
  end

  def destory
  end
end
