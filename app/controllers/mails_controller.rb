class MailsController < ApplicationController
  # before_action :login_required, except: [:new, :create, :index]
  layout 'mail'
  def index
    if notice.present?
      @user = notice[0]
      @pass = notice[1]
    end
  end

  def new
    @user = User.new
  end
  def create
    a = User.where(email: params[:user][:email])
    if a.present?
      redirect_to "/register", notice: "このメールアドレスは登録されています"
    else
      @pass = SecureRandom.alphanumeric(10)
      @user = User.new(identifier: @pass, password: @pass, email: params[:user][:email],sex: 3, agreement: params[:user][:agreement])
      tt = @user.timetables.new
      if @user.save && tt.save
        # SendMailer.with(user: @user, pass: @pass).published_email.deliver_later
        redirect_to :mails, notice: [@user,@pass]
      else
        render "new"
      end
    end
  end
end
