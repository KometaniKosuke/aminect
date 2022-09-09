class RequestsController < ApplicationController
  def index
    @requests = Request.where(user_id: current_user.id)
    @requests.order(id: "DESC")
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new(user_id: current_user.id)
  end

  def create
    @request = Request.new(params[:request])
    @request.assign_attributes(user_id: current_user.id)
    if @request.save
      redirect_to new_request_path, notice: "質問を投稿しました。"
    else
      render "new"
    end
  end
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to :requests, notice: "質問を削除しました。"
  end
end
