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

  def tag_search
    tagname = params[:tagname]
    tags = Tag.where.not(ancestry: nil)
    tag_m = tags.find_by(name: tagname)
    if tag_m.present?
      tag_r = TagRelation.where(tag1_id: tag_m.id).or(TagRelation.where(tag2_id: tag_m.id)).order(:degree)
      @users=Array.new
      if tag_r.present?
        tag_r.each do |tr|
          id = 0
          if tr.tag1_id <= tr.tag2_id
            id = tr.tag1_id
          else
            id = tr.tag2_id
          end
          uts = UserTag.where(tag_id: id)
          uts.each do |ut|
            u = User.find(ut.user_id)
            if !@users.include?(u) && u!=current_user
              @users.append(u)
            end
          end
        end
      end
    end
    render "index"
  end
end
