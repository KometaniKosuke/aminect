class AccountsController < ApplicationController
  before_action :login_required, except: [:new, :create]

  def show
    @user=current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to :user, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to :root, notice: "会員情報を登録しました。"
    else
      render "new"
    end
  end
end
