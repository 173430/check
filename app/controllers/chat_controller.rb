class ChatController < ApplicationController
  def show
    @group_id = params[:group_id]
    @user_id = current_user.id
    @user_icon = current_user.icon
    @messages = Message.where(group_id: @group_id)
  end
 
  def new_message
    logger.debug("Call new_message : #{Message}")
    broadcast_message :new_message, message
  end
end
