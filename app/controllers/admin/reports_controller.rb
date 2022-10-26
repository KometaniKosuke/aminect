class Admin::ReportsController < Admin::Base
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

  def index
    @reports = Report.order("id")
  end
end
