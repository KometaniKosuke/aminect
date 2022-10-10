class DealsController < ApplicationController
  before_action :login_required
  # ブロックするとき
  def create
    current_user.block(params[:user_id])
    user = User.find(params[:user_id])
    redirect_to :users, notice: "ブロックしました"
  end
  # ブロックを外すとき
  def destroy
    # current_user.unfollow(params[:user_id])
    user = User.find(params[:user_id])
    f = Deal.find_by(from_id: current_user.id, to_id: user.id)
    f.destroy
    redirect_to :users, notice: "ブロックを解除しました"
  end
  # ブロック一覧
  def blockings
    @blockings = current_user.blockings
    render "index"
  end
  # ブロック一覧
  def blockers
    @blockers = current_user.blockers
    render "index"
  end
end
