class AgreesController < ApplicationController
  layout 'agree'
  def new
    @user = current_user
  end
  def create
    if params[:agreement] == "1"
      current_user.update(agreement: :true)
      current_user.save
      redirect_to :root
    else
      flash.alert = "利用には同意が必要です。"
      render "new"
    end
  end

  def update
    if params[:user][:agreement] == "1"
      current_user.update(agreement: :true)
      current_user.save
      redirect_to :root
    else
      flash.alert = "利用には同意が必要です。"
      render "new"
    end
  end
end
