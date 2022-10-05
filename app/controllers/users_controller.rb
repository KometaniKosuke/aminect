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
  end

  def create
    # 後々バリデーションを行うーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
    a = User.where(email: params[:user][:email])
    if a.present?
      redirect_to "/register", notice: "このメールアドレスは既に登録されています。"
    else
      @pass = SecureRandom.alphanumeric(10)
      @user = User.new(password: @pass,email: params[:user][:email])
      if @user.save
        SendMailer.with(user: @user, pass: @pass).published_email.deliver_later
        redirect_to :mails, notice: @user.email
      else
        render "/register"
      end
    end
  end

  def destory
  end
end
