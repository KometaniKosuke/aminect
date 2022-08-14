class ApplicationController < ActionController::Base
  private def current_user
    User.find_by(id: cookies.signed[:user_id]) if cookies.signed[:user_id]
  end
  helper_method :current_user

  class LoginRequired < StandardError; end
  class Forbidden < StandardError; end

  private def login_required
    raise LoginRequired unless current_user
  end
end
