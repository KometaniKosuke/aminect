class ProfilesController < ApplicationController
  before_action :login_required
  before_action :set_user,only: %i[edit update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path,success: "ユーザーを更新しました"
    else
      flash.now[:danger] = "ユーザーを更新できませんでした"
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :sex, :birthplace, :undergraduate, :password, :image)
  end
end
