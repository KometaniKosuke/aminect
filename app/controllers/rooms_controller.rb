class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
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
