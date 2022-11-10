class Admin::SessionsController < Admin::Base
  def create
    admin = Administrator.find_by(name: params[:name])
    if admin&.authenticate(params[:password])
      cookies.signed[:admin_id] = { value: admin.id, expires: 30.minutes.from_now }
      redirect_to :admin_root, notice: "#{params[:name]}さんがログインしました。"
      return
    else
      flash.alert = "名前とパスワードが一致しません"
    end
    redirect_to :admin_root
  end

  def destroy
    cookies.delete(:admin_id)
    redirect_to :admin_root, notice: "ログアウトしました。"
  end
end
