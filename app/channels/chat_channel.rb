class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
    ActionCable.server.broadcast 'chat_channel',message:'入室しました'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = Message.create!(body: data['message'], group_id: data['group_id'], user_id: current_user.id)
    ActionCable.server.broadcast 'chat_channel', message: data['message'], group_id: data['group_id'], user_id: data['user_id']
  end
end

