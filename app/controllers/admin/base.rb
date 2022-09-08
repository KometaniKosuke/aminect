class Admin::Base < ApplicationController
  layout "admin/layouts/base"

  private def current_admin
    Administrator.find_by(id: cookies.signed[:admin_id]) if cookies.signed[:admin_id]
  end
  helper_method :current_admin

  class AdminLoginRequired < StandardError; end
  rescue_from AdminLoginRequired, with: :rescue_admin_login_required

  private def admin_login_required
    raise AdminLoginRequired unless current_admin
  end

  private def rescue_admin_login_required(exception)
    render "admin/errors/login_required", status: 403, formats: [:html]
  end
end
