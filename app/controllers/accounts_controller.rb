class AccountsController < ApplicationController
  before_action :login_required, except: [:new, :create, :update]
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

  def update
    @user = current_user
    @user.assign_attributes(params[:account])
    if @user.save
      redirect_to :account, notice: "アカウント情報を更新しました"
    else
      render "edit"
    end
  end

  def new
    @user = User.find_by(email: params[:email])
    if @user.present?
      if @user&.authenticate(params[:password])
        @timetable = @user.timetables.new
      else
        @user = nil
        flash.notice="パスワードに誤りがあります"
        render "new"
      end
    else
      flash.notice="メールアドレスに誤りがあります"
      render "new"
    end
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    @user.assign_attributes(user_params)
    tt = @user.timetables.new
    if @user.save && tt.save
      cookies.signed[:user_id] = { value: @user.id, expires: 2.hours.from_now }
      redirect_to :edit_password, notice: "パスワードを変更できます"
    else
      render "new"
    end
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
    params.require(:user).permit(:name, :sex, :birthplace, :undergraduate, :grade, :comment, :image, :twitter, :instagram, :email)
  end

  private def register_params
    params.require(:user).permit(:email, :password)
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
end
