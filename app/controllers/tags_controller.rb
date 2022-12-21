class TagsController < ApplicationController
  before_action :login_required
  def index
  end
  def create
    ts = UserTag.where(user_id: current_user.id)
    altags = ts.pluck(:tag_id)
    hash = params[:tag].to_h
    k = hash.find_all{|k ,v| v=="1"}
    if k.size <= 30
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
      flash.notice="タグを変更しました"
      redirect_to :account
    else
      flash.alert = "タグの上限は30個です"
      render "new"
    end
  end

  def tag_search
    tagname = params[:tagname]
    if tagname != "おすすめ"
      tag = Tag.find_by(name: tagname)
      users = UserTag.where(tag_id: tag.id).pluck(:user_id)
      if users.present?
        @users=Array.new
        users.each do |u|
          if User.find(u)!=current_user
            @users.append(User.find(u))
          end
        end
      end
    end
    render "index"
  end
end
