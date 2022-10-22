class AnnouncesController < ApplicationController
  # before_action :login_required
  def index
    @announces = Announce.where(user_id: [nil, 0, current_user.id])
    @announces = @announces.order(id: "DESC")
  end
end
