class PostsController < ApplicationController
  before_action :login_required
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(user_id: current_user.id, post_img: params[:post][:post_img], text: params[:post][:text])
    if @post.save
      redirect_to :account, notice: "投稿しました"
    else
      render "new"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    path = Dir.pwd+"/public/uploads/post/post_img/#{params[:id]}/"
    FileUtils.remove_dir(path)
    redirect_to :account, notice: "投稿を削除しました"
  end
end
