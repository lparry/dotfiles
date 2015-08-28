$("body").append('<div id="use_tweetbot">Use Tweetbot</div>');
$("#use_tweetbot").css({
  'position': 'fixed',
  'top': '25%',
  'left': '50%',
  'z-index': '1000',
  'background': 'darkgrey',
  'padding': '30px',
  'font-size': '30px',
  'border-radius': '30px'
});
$("#use_tweetbot").click(function() {
  $("#use_tweetbot").hide();
});
