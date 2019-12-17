class ChatController < ApplicationController
    def show
      @messages = Message.all
      @user = current_user
    end
   
end
