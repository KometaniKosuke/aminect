class TimetablesController < ApplicationController
  def index
  end

  def edit
    @timetable = Timetable.find(params[:id])
  end

  def update
    tt = Timetable.find(params[:id])
    tt.assign_attributes(params[:timetable])
    if tt.save
      redirect_to :account, notice: "時間割を変更しました"
    end
  end
  def search
    hash = params[:tt].to_h
    k = hash.find_all{|k ,v| v=="1"}
    @keys = k.to_h
    @users = Array.new
    timetable = Timetable.where.not(id: current_user.id)
    # -------------------------------------
    if params[:commit]=="あいまい検索"
      @keys.each do |k|
        ts = timetable.where(k)
        ts.each do |t|
          a = User.find(t.user_id)
          @users.push(a)
        end
      end
      @users = @users.uniq
    # ------------------------------------
    elsif params[:commit]=="ピッタリ検索"
      ts = timetable.all
      @keys.each do |k|
        ts = ts.where(k)
      end
      ts.each do |t|
        a = User.find(t.user_id)
        @users.push(a)
      end
    end
    # ------------------------------------
    render "index"
  end
end
