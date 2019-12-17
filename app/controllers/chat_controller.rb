class ChatController < ApplicationController
    def show
      @messages = Message.all
      @userid = current_user
    end
   
end
