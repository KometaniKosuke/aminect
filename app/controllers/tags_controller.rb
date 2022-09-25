class TagsController < ApplicationController
  def index
    # @user_tags = current_user.user_tags
    # @tags = current_user.tags.first
  end

  def new
  end

  def create
    ts = UserTag.where(user_id: current_user.id)
    altags = ts.pluck(:tag_id)
    hash = params[:tag].to_h
    k = hash.find_all{|k ,v| v=="1"}
    tags = k.to_h.keys
    tags= tags.map!{|x| x.to_i}
    tags.each do |tag|
      if altags.include?(tag)
        altags.delete(tag)
      else
        ut=UserTag.new(user_id: current_user.id, tag_id: tag)
        ut.save
      end
    end
    altags.each do |al|
      UserTag.find_by(user_id: current_user.id, tag_id: al).destroy
    end
    redirect_to :account
  end

  # def image_set
  #   user = params[:user_id]
  #   tag = params[:tag_id]
  #   ut = UserTag.find_by(user_id: user, tag_id: tag)
  #   ut.update(tag_image: params[:tag_image])
  #   ut.save
  #   redirect_to :account
  # end
end
