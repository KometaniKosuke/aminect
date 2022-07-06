class ApplicationController < ActionController::Base
  private def current_user
    User.find_by(id: cookies.signed[:user_id]) if cookies.signed[:user_id]
  end
  helper_method :current_user
end
module Chat
  class Application < Rails::Application
    config.time_zone = 'Asia/Tokyo'
  end
end
