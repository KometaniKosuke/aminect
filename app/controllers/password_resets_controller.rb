class PasswordResetsController < ApplicationController
  layout 'pass_reset'
  def index
    @user = nil
  end

  def new
    @user = User.find_by(email: params[:email])
    if !@user.present?
      redirect_to :password_resets, notice: "該当するユーザはいません。"
    end
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    @user.update_attributes(password: params[:user][:password])
    if @user.save
      render "index"
    else
      render "new"
    end
  end
end
