class ChatController < ApplicationController
  def show
    @messages = Message.all
    @group_id = params[:group_id]
    @user = current_user
  end
 
  def new_message
    logger.debug("Call new_message : #{Message}")
    broadcast_message :new_message, message
  end
end
