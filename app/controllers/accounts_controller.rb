class AccountsController < ApplicationController
  before_action :login_required, except: [:new, :create, :update]

  def show
    @user=current_user
    @timetable=Timetable.find(current_user.id)
    @follows = Follow.where(from_id: current_user)
    @followers = Follow.where(to_id: current_user)
  end

  def edit
    @user = current_user
    @timetable=Timetable.find_by(user_id: current_user.id)
  end

  def update
    @user = current_user
    @user.assign_attributes(account_params)
    tt=Timetable.find_by(user_id: current_user.id)
    tt.assign_attributes(params[:account][:timetable])
    if @user.save
      if tt.save
        redirect_to :account, notice: "アカウント情報を更新しました。"
      end
    else
      render "edit"
    end
  end

  def new
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user&.authenticate(params[:password])
        @timetable = @user.timetables.new
      else
        @user= nil
        redirect_to :new_account, notice: "パスワードが違います。"
      end
    else
      render "new"
    end
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    @user.assign_attributes(user_params)
    tt = @user.timetables.new(params[:user][:timetable])
    if @user.save && tt.save
      cookies.signed[:user_id] = { value: @user.id }
      redirect_to :root, notice: "会員情報を登録しました。"
    end
  end

  private def account_params
    params.require(:account).permit(:name, :sex, :birthplace, :undergraduate, :comment, :image, :twitter, :instagram, :tiktok, timetables_attributes: [:timetable, :destroy, :id])
  end
  private def user_params
    params.require(:user).permit(:name, :sex, :birthplace, :undergraduate, :comment, :image, :twitter, :instagram, :tiktok, :email)
  end

  private def register_params
    params.require(:user).permit(:email, :password)
  end
end
