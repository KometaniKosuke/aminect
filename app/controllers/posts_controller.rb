class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(user_id: current_user.id, post_img: params[:post][:post_img], text: params[:post][:text])
    if @post.save
      redirect_to :account, notice: "投稿しました。"
    else
      render "new"
    end
  end
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.assign_attributes(post_params)
    if @post.save
      redirect_to :account, notice: "投稿を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
  end

  private def post_params
    params.require(:post).permit(:text, :img)
 end
end
