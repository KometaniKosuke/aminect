class PasswordResetsController < ApplicationController
  layout 'pass_reset'
  def index
    @user = nil
  end

  def new
    @user = User.find_by(email: params[:email])
    if !@user.present?
      flash.alert="このメールアドレスに該当するユーザはいません"
      render "index"
    else
      if @user.identifier != params[:identifier]
        @user = nil
        flash.alert="初期パスワードに誤りがあります"
        render "index"
      end
    end
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if params[:user][:password].length>=8
      if params[:user][:password].length<=15
        pass = params[:user][:password].match(/\A[0-9a-zA-Z]+\z/)
        if pass.present?
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
          flash.notice = "パスワードは半角英数字のみ有効です"
          render "new"
        end
      else
        flash.notice = "パスワードが長すぎます(8~15文字)"
        render "new"
      end
    else
      flash.notice = "パスワードが短すぎます(8~15文字)"
      render "new"
    end
  end
end
