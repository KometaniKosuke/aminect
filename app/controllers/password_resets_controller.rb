class PasswordResetsController < ApplicationController
  layout 'pass_reset'
  def index
    @user = nil
  end

  def new
    @user = User.find_by(email: params[:email])
    if !@user.present?
      redirect_to :password_resets, notice: "該当するユーザはいません"
    end
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if params[:user][:password].length>=8 && params[:user][:password].length<=15
      if params[:user][:password]==params[:user][:password_confirmation]
        @user.update_attributes(password: params[:user][:password])
        if @user.save
          render "index"
        else
          render "new"
        end
      else
        flash.notice = "確認用に誤りがあります"
        render "new"
      end
    else
      flash.notice = "パスワードは8~15文字にしてください"
      render "new"
    end
  end
end
