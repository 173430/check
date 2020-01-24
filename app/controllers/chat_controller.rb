class ChatController < ApplicationController
  def show
    @group_id = params[:group_id]
    @group_name = Group.find(@group_id).name
    @user_id = current_user.id
    @user_name = User.find(@user_id).name
    @messages = Message.where(group_id: @group_id)
  end
 
  def new_message
    logger.debug("Call new_message : #{Message}")
    broadcast_message :new_message, message
  end
end
