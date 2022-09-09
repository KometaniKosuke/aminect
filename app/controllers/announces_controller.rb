class AnnouncesController < ApplicationController
  # before_action :login_required
  def index
    @announces = Announce.all
  end
end
