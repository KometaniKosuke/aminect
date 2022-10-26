class Admin::UsersController < Admin::Base
  before_action :admin_login_required
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

  def destroy
    @user = User.find(params[:id])
    # ------------------------------------------
    an = @user.announces #告知
    if an.present?
      an.each do |a|
        a.destroy
      end
    end
    # ------------------------------------------
    b=Deal.where(from_id: params[:id]) #ブロック
    if b.present?
      b.each do |a|
        a.destroy
      end
    end
    b=Deal.where(to_id: params[:id]) #ブロック
    if b.present?
      b.each do |a|
        a.destroy
      end
    end
    # ------------------------------------------
    follow=Follow.where(from_id: params[:id]) #フォロー
    if follow.present?
      follow.each do |a|
        a.destroy
      end
    end
    follower=Follow.where(to_id: params[:id]) #フォロワー
    if follower.present?
      follower.each do |a|
        a.destroy
      end
    end
    # ------------------------------------------
    an = @user.messages #メッセージ
    if an.present?
      an.each do |a|
        a.destroy
      end
    end
    # ------------------------------------------
    an = @user.posts #投稿
    if an.present?
      an.each do |a|
        a.destroy
      end
    end
    # ------------------------------------------
    rep=Report.where(from_id: params[:id]) #通報
    if rep.present?
      rep.each do |a|
        a.destroy
      end
    end
    rep=Report.where(to_id: params[:id]) #通報
    if rep.present?
      rep.each do |a|
        a.destroy
      end
    end
    # ------------------------------------------
    urs = UserRoom.where(user_id: @user.id) #ルーム、UserRoom
    if urs.present?
      urs.each do |ur|
        room_id=ur.room_id
        ur.destroy
        UserRoom.find_by(room_id: room_id).destroy
        room=Room.find(room_id).destroy
      end
    end
    # ------------------------------------------
    uts = UserTag.where(user_id: @user.id)
    if uts.present?
      uts.each do |ut|
        ut.destroy
      end
    end
    # ------------------------------------------
    an = @user.timetables #時間割
    if an.present?
      an.each do |a|
        a.destroy
      end
    end
    # ------------------------------------------
    @user.destroy
    redirect_to :admin_users, notice: "ユーザを削除しました。"
  end
end
