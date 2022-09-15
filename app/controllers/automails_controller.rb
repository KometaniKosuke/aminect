class AutomailsController < ApplicationController
  before_action :login_required, except: [:new, :create, :index]
  def index
  end

  def new
    @automail = Automail.new
  end

  def create
    uid = rand(1..9)*10000+rand(10)*1000+rand(10)*100+rand(10)*10+rand(10)
    @pass = SecureRandom.alphanumeric(10)
    user = User.new(uid: uid, password: @pass)
    user.save
    @automail = Automail.new(user_id: user.id,email: params[:automail][:email])
    if @automail.save
      SendMailer.with(user: @automail, pass: @pass).published_email.deliver_later
      redirect_to :automails
    else
      render "new"
    end
  end

  def destroy
    @automail.destroy
  end

  private
    def set_automail
      @automail = Automail.find(params[:id])
    end

    def automail_params
      params.require(:automail).permit(:email)
    end
end
