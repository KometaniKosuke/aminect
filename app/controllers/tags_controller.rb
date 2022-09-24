class TagsController < ApplicationController
  def new
  end

  def create
    ts = UserTag.where(user_id: current_user.id)
    @altags = ts.pluck(:tag_id)
    hash = params[:tag].to_h
    k = hash.find_all{|k ,v| v=="1"}
    @tags = k.to_h.keys
    @tags= @tags.map!{|x| x.to_i}
    @tags.each do |tag|
      unless @altags.include?(tag)
        ut=UserTag.new(user_id: current_user.id, tag_id: tag)
        ut.save
      else
        @altags.delete(tag)
      end
    end
    @altags.each do |al|
      UserTag.find_by(user_id: current_user.id, tag_id: al).destroy
    end
    redirect_to :account
  end
end
