class TopController < ApplicationController
  def index
    unless current_user.agreement
      redirect_to new_account_agrees_path
    end
  end
end
