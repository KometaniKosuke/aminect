class PasswordResetsController < ApplicationController
  # render "errors/uid_login_required"
  layout 'pass_reset'

  def index
    @user = nil
  end

  def new
    param=params[:uid].to_s
    @user = User.find_by(uid: param.to_i)
    if !@user.present?
      redirect_to :password_resets, notice: "該当するユーザはいません。"
    end
  end

  def create
    param=params[:user][:uid].to_s
    @user = User.find_by(uid: param.to_i)
    @user.update_attributes(password: pass_params[:password])
    if @user.save
      render "index"
    else
      render "new"
    end
  end

  private def pass_params
    params.require(:user).permit(:password)
  end
end
