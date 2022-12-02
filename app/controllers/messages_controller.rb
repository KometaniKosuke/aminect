class MessagesController < ApplicationController
  before_action :login_required

  def create
    @message = Message.new(room_id: params[:message][:room_id])
    @message.text=params[:message][:text]
    @message.created_at=Time.now
    @message.user_id=current_user.id
    room=Room.find(params[:message][:room_id])
    room.updated_at=Time.now
    room.save
    if @message.save
      redirect_to Room.find(params[:message][:room_id])
    end
  end

  private def message_params
    params.require(:message).permit(:text, :room_id)
  end
end
