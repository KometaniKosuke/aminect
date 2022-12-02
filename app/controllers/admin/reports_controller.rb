class Admin::ReportsController < Admin::Base
  # 通報外すとき
  def destroy
    report = Report.find(params[:id])
    report.destroy
    redirect_to :admin_reports, notice: "通報を削除しました"
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
