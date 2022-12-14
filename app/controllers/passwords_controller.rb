class PasswordsController < ApplicationController
  before_action :login_required

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    current_password = params[:account][:current_password]
    if current_password.present?
      if @user.authenticate(current_password)
        @user.assign_attributes(params[:account])
        if @user.save(context: :pass)
          redirect_to :account, notice: "パスワードを変更しました"
        else
          render "edit"
        end
      else
        @user.errors.add(:current_password, :wrong)
        render "edit"
      end
    else
      @user.errors.add(:current_password, :empty)
      render "edit"
    end
  end
end
