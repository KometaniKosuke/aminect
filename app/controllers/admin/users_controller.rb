class Admin::UsersController < Admin::Base
  before_action :admin_login_required
  def index
    @users = User.order("id")
    # @follow = Relationship.where(follower_id: current_user)
    # @follower = Relationship.where(followed_id: current_user)
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
