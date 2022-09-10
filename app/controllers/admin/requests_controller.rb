class Admin::RequestsController < Admin::Base
  def index
    @requests = Request.order(id: "DESC")
  end

  def edit
    @request = Request.find(params[:id])
  end
  def update
    @request = Request.find(params[:id])
    @request.assign_attributes(params[:request])
    if @request.save
      redirect_to [:edit_admin, @request], notice: "質問に回答しました。"
    else
      render "edit"
    end
  end
end
