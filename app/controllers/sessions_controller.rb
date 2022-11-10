class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      cookies.signed[:user_id] = { value: user.id,expires: 2.days.from_now }
    else
      flash.alert = "名前とパスワードが一致しません"
    end
    redirect_to :root
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to :root
  end
end
