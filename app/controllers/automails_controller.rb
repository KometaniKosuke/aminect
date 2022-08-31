class AutomailsController < ApplicationController
  def index
  end

  def new
    @automail = Automail.new
  end

  def create
    @automail = Automail.new(automail_params)

    if @automail.save
      SendMailer.with(user: @automail).published_email.deliver_later
      @automail.destroy
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
