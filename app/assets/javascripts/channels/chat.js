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
    return this.perform('speak',{
      message: message
    });
  }
});
setTimeout(function() {
  window.scroll(0,$(document).height());
},0);

// 実行
document.getElementById( "fire" ).addEventListener( "click", function() {
	try {
		// 要素を取得
		var pElement = document.getElementById( "target" ) ;

		// scrollHeightを取得
		var scrollHeight = pElement.scrollHeight ;

		// 取得した結果を出力
		document.getElementById( "output" ).textContent = scrollHeight ;

		// コンソールで内容を出力
		console.log( scrollHeight ) ;

		// エラーを非表示
		errorElement.className = "error none" ;

	// エラー表示
	} catch ( msg ) {
		errorElement.className = "error" ;
		errorElement.textContent = msg ;
		console.error( msg ) ;

	}
} ) ;

setTimeout(function() {
  window.scroll(0,$(document).height());
},0);


/*
$(document).on('keypress', '[data-behavior="chat_input"]', function(event) {
  if (event.keyCode === 13) {
    App.chat.speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
});
*/


