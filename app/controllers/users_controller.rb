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

  # def create
  #   a = User.where(email: params[:user][:email])
  #   if a.present?
  #     redirect_to "/register", notice: "このメールアドレスは既に登録されています。"
  #   else
  #     @pass = SecureRandom.alphanumeric(10)
  #     @user = User.new(password: @pass, email: params[:user][:email], agreement: params[:user][:agreement])
  #     if @user.save
  #       SendMailer.with(user: @user, pass: @pass).published_email.deliver_later
  #       redirect_to :mails, notice: @user.email
  #     else
  #       render "mails/new"
  #     end
  #   end
  # end

  def destory
  end
end
