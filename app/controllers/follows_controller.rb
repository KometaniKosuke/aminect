class FollowsController < ApplicationController
  before_action :login_required
  # フォローするとき
  def create
    current_user.follow(params[:user_id])
    user = User.find(params[:user_id])
    redirect_to user, notice: "フォローしました"
  end
  # フォロー外すとき
  def destroy
    # current_user.unfollow(params[:user_id])
    user = User.find(params[:user_id])
    f = Follow.find_by(from_id: current_user.id, to_id: user.id)
    f.destroy
    redirect_to user, notice: "フォローを解除しました"
  end
  # フォロー一覧
  def followings
    @followings = current_user.followings
    render "index"
  end
  # フォロワー一覧
  def followers
    @followers = current_user.followers
    render "index"
  end
end
