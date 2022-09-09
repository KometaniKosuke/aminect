class Admin::AnnouncesController < Admin::Base
  before_action :admin_login_required
  def index
    @announces = Announce.all
  end
  def new
    @announce = Announce.new
  end

  def create
    @announce = Announce.new(params[:announce])
    if @announce.save
      redirect_to :admin_announces, notice: "投稿しました。"
    else
      render "new"
    end
  end

  def edit
    @announce = Announce.find(params[:id])
  end

  def update
    @announce = Announce.find(params[:id])
    @announce.assign_attributes(params[:announce])
    if @announce.save
      redirect_to :admin_announces, notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @announce = Announce.find(params[:id])
    @announce.destroy
    redirect_to :admin_announces, notice: "投稿を削除しました。"
  end
end
