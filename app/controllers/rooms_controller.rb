class RoomsController < ApplicationController
  layout 'chat', only: :show
  before_action :login_required

  def index
    urs = UserRoom.order(updated_at: :DESC).where(user_id: current_user.id)
    @rooms = urs.pluck(:room_id)
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
  end

  def new
    u1=User.find(current_user.id)
    u2=User.find(params[:user_id])
    name=u1.name+"-"+u2.name
    @room=Room.create(name: name, user_ids: [u1.id, u2.id])
    redirect_to @room
  end

  def create
  end

  def destroy
  end
end
