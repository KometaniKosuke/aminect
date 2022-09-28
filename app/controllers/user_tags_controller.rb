class UserTagsController < ApplicationController
  def show
    @user_tag = UserTag.find(params[:id])
  end
end
