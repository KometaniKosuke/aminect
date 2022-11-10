class Admin::AnnouncesController < Admin::Base
  before_action :admin_login_required
  def index
    @announces = Announce.all
    @announces = @announces.order(id: "DESC")
  end

  def show
    @announce = Announce.find(params[:id])
  end

  def new
    @announce = Announce.new
  end

  def create
    @announce = Announce.new(params[:announce])
    if params[:announce][:url_title].present? && params[:announce][:url].present?
      if @announce.save
        redirect_to :admin_announces, notice: "告知・警告しました"
      else
        render "new"
      end
    elsif params[:announce][:url_title]==params[:announce][:url]
      if @announce.save
        redirect_to :admin_announces, notice: "告知・警告しました"
      else
        render "new"
      end
    else
      flash.notice = "URLとURLタイトルはセットにしてください"
      render "new"
    end
  end

  def edit
    @announce = Announce.find(params[:id])
  end

  def update
    @announce = Announce.find(params[:id])
    if params[:announce][:url_title].present? && params[:announce][:url].present?
      @announce.assign_attributes(params[:announce])
      if @announce.save
        redirect_to :admin_announces, notice: "告知・警告を更新しました。"
      else
        render "edit"
      end
    elsif params[:announce][:url_title].nil? && params[:announce][:url].nil?
      @announce.assign_attributes(params[:announce])
      if @announce.save
        redirect_to :admin_announces, notice: "告知・警告を更新しました。"
      else
        render "edit"
      end
    else
      flash.notice = "URLとURLタイトルはセットにしてください"
      render "edit"
    end
  end

  def destroy
    @announce = Announce.find(params[:id])
    @announce.destroy
    redirect_to :admin_announces, notice: "告知・警告を削除しました。"
  end
end
