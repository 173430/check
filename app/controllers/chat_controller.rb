class ChatController < ApplicationController
  def show
    @message = Message.all
    @group_id = params[:group_id]
    @user_id = current_user.id
  end
 
  def new_message
    logger.debug("Call new_message : #{Message}")
    broadcast_message :new_message, message
  end
end
