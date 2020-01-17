App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    var group_id = $('#group_id').val();
    var user_id = $('#user_id').val();
    if(group_id == data['group_id']){
    $('#messages').append('<li>' + data['message'] + '</li>');
    $('#target').scrollTop($('#target').get(0).scrollHeight);
    }
    return
  },

  speak: function(message,group_id,user_id) {
    return this.perform('speak',{
      message: message,
      group_id: group_id,
      user_id: user_id
    });
  }
});

/*
$(document).on('keypress', '[data-behavior="chat_input"]', function(event) {
  if (event.keyCode === 13) {
    App.chat.speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
});
*/

