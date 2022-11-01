class TopController < ApplicationController
  def index
    if current_user.present?
      unless current_user.agreement
        redirect_to new_account_agrees_path
      end
    end
  end
end
