class AnnouncesController < ApplicationController
  # before_action :login_required
  def index
    @announces = Announce.all
    @announces = @announces.order(id: "DESC")
  end
end
