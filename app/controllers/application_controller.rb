class ApplicationController < ActionController::Base
  before_action :update_expiration_time
  
  private def current_user
    User.find_by(id: cookies.signed[:user_id]) if cookies.signed[:user_id]
  end
  helper_method :current_user

  private def update_expiration_time
    if cookies.signed[:user_id]
      cookies.signed[:user_id] = {value: cookies.signed[:user_id],expires: 2.days.from_now}
    end
  end

  class LoginRequired < StandardError; end
  rescue_from LoginRequired, with: :rescue_login_required

  private def login_required
    raise LoginRequired unless current_user
  end

  private def rescue_login_required(exception)
    render "errors/login_required", status: 403, formats: [:html]
  end
end
