class RoomsController < ApplicationController
  layout 'chat', only: :show
  before_action :login_required

  def index
    urs = UserRoom.where(user_id: current_user.id).pluck(:room_id)
    r = Array.new
    urs.each do |ur|
      a = Room.find(ur)
      r.append([a.updated_at.to_i,a.id])
    end
    r = r.sort.reverse
    @rooms = Array.new
    r.each do |rr|
      @rooms.append(rr[1])
    end
    unless current_user.agreement
      redirect_to new_account_agrees_path
    end
  end

  def show
    @room = Room.find(params[:id])
    urs = UserRoom.where(room_id: @room.id)
    talker = urs.where.not(user_id: current_user.id)
    ur = urs.where(user_id: current_user.id)
    ur.update(date: Time.current)
    @talker = User.find_by(id: talker.first.user_id)
    @messages = @room.messages
    @message = Message.new(room_id: @room.id, user_id: current_user.id)
    unless current_user.agreement
      redirect_to new_account_agrees_path
    end
  end

  def new
    u1=User.find(current_user.id)
    u2=User.find(params[:user_id])
    name=u1.name+"-"+u2.name
    @room=Room.create(name: name, user_ids: [u1.id, u2.id])
    ur1=UserRoom.find_by(user_id:u1.id, room_id: @room.id)
    ur1.date=Time.current
    ur1.save
    ur2=UserRoom.find_by(user_id:u2.id, room_id: @room.id)
    ur2.date=Time.current
    ur2.save
    redirect_to @room
  end

  def create
  end

  def destroy
    @room = Room.find(params[:id])
    urs = UserRoom.where(room_id: @room.id)
    urs.each do |ur|
      ur.destroy
    end
    @room.destroy
    redirect_to :rooms, notice: "トークルームを削除しました"
  end
end
