App.chat = App.cable.subscriptions.create("ChatChannel", {
    connected: function() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },
  
    received: function(data) {
      return $('#messages').append('<li>' + data['message'] + '</li>');
    },
  
    speak: function(message) {
      return this.perform('speak', {
        message: message
      });
    }
  });
  
  
  $(document).on('keypress', '[data-behavior="chat_input"]', function(event) {
    if (event.keyCode === 13) {
      App.chat.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
