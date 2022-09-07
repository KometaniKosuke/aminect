class MessagesController < ApplicationController
  # def show
  #   @user = User.find(params[:id])
  #   rooms = current_user.user_rooms.pluck(:room_id)
  #   user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)
  #
  #   unless user_rooms.nil?
  #     @room = user_rooms.room
  #   else
  #     @room = Room.new
  #     @room.save
  #     UserRoom.create(user_id: current_user.id, room_id: @room.id)
  #     UserRoom.create(user_id: @user.id, room_id: @room.id)
  #   end
  #   @messages = @room.messages
  #   @message = Message.new(room_id: @room.id)
  # end
  def create
    @message = Message.new(room_id: params[:message][:room_id])
    @message.text=params[:message][:text]
    @message.date=Time.now
    @message.user_id=current_user.id
    if @message.save
      urs=UserRoom.where(room_id: params[:message][:room_id])
      urs.each do |ur|
        ur.updated_at=Time.now
        ur.save
      end
      redirect_to Room.find(params[:message][:room_id])
    end
  end

  private def message_params
    params.require(:message).permit(:text, :room_id)
  end
end
