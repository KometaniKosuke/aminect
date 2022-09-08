class ApplicationController < ActionController::Base
  private def current_user
    User.find_by(id: cookies.signed[:user_id]) if cookies.signed[:user_id]
  end
  helper_method :current_user

  class LoginRequired < StandardError; end
  rescue_from LoginRequired, with: :rescue_login_required

  private def login_required
    raise LoginRequired unless current_user
  end

  private def rescue_login_required(exception)
    render "errors/login_required", status: 403, formats: [:html]
  end
end
