class MailsController < ApplicationController
  # before_action :login_required, except: [:new, :create, :index]
  layout 'mail'
  def index
  end

  def new
    @user = User.new
  end
  def create
    a = User.where(email: params[:user][:email])
    if a.present?
      redirect_to "/register", notice: "このメールアドレスは既に登録されています。"
    else
      @pass = SecureRandom.alphanumeric(10)
      @user = User.new(password: @pass, email: params[:user][:email], agreement: params[:user][:agreement])
      if @user.save
        SendMailer.with(user: @user, pass: @pass).published_email.deliver_later
        redirect_to :mails, notice: @user.email
      else
        render "new"
      end
    end
  end
end
