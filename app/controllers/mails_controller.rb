class MailsController < ApplicationController
  # before_action :login_required, except: [:new, :create, :index]
  def index
  end

  def new
    @user = User.new
  end
end
