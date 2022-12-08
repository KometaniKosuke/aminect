class AccountsController < ApplicationController
  before_action :login_required, except: [:new, :create, :update,:check, :confirm, :edit_confirm,:cancel]
  layout 'account'

  def show
    @user=current_user
    @timetable=Timetable.find_by(user_id: current_user.id)
    @follows = Follow.where(from_id: current_user)
    @followers = Follow.where(to_id: current_user)
    @tags = current_user.tags
    @posts = current_user.posts
    unless current_user.agreement
      redirect_to new_account_agrees_path
    end
  end

  def edit
    @user = current_user
    @timetable=Timetable.find_by(user_id: current_user.id)
    @tags = current_user.tags
  end

  def edit_confirm
    @user = current_user
    @user.attributes = params[:account]
    render :edit if @user.invalid?
  end

  def update
    @user = current_user
    @user.assign_attributes(params[:account])
    render "edit" and return if params[:back]
    if @user.save
      redirect_to :account, notice: "アカウント情報を更新しました"
    else
      render "edit"
    end
  end

  def new
    @user = User.find_by(email: params[:email])
    if @user.present?
      unless @user.identifier == params[:password]
        @user = nil
        flash.notice="パスワードに誤りがあります"
        render "check"
      end
    else
      flash.notice="メールアドレスに誤りがあります"
      render "check"
    end
  end

  def confirm
    @user = User.find_by(email: params[:user][:email])
    @user.assign_attributes(user_params)
    render :new if @user.invalid?
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    @user.assign_attributes(user_params)
    render "new" and return if params[:back]
    if @user.save
      cookies.signed[:user_id] = { value: @user.id, expires: 2.hours.from_now }
      redirect_to :edit_password, notice: "登録が完了しました(パスワードを変更できます)"
    else
      render "new"
    end
  end

  def cancel
    user = User.find_by(email: params[:user][:email])
    tt = Timetable.find_by(user_id: user.id)
    user.destroy
    tt.destroy
    redirect_to :root, alert: "登録をキャンセルしました"
  end

  def check
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  def after_update_path_for(_resource)
     :account
   end

  private def user_params
    params.require(:user).permit(:name, :sex, :birthplace, :undergraduate, :grade, :comment, :image, :image_cache, :twitter, :instagram, :email)
  end

  private def register_params
    params.require(:user).permit(:email, :password)
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
end
