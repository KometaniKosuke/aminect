class ReportsController < ApplicationController
  # 通報するとき
  def create
    current_user.report(params[:user_id])
    redirect_to request.referer
  end
  # 通報外すとき
  def destroy
    current_user.unreport(params[:user_id])
    redirect_to request.referer
  end
  # 通報一覧
  def reportings
    user = User.find(params[:user_id])
    @users = user.followings
  end
    # 通報者一覧
  def reporters
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
