class RequestsController < ApplicationController
  before_action :login_required
  def index
    @user = current_user
  end
end
