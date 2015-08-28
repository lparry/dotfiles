stop_fucking_my_middleclicks = function() {
  $('a[class=gotoMicrosite]').removeClass('gotoMicrosite');
  setTimeout(stop_fucking_my_middleclicks, 2000)
};
stop_fucking_my_middleclicks();

$("body").append('<div id="dot_js_button">Dorms only</div>');
$("#dot_js_button").css({
  'position': 'fixed',
  'top': '90%',
  'left': '90%',
  'z-index': '1000',
  'background': 'lightgrey',
  'padding': '5px',
  'font-size': '15px',
  'border-radius': '5px'
});

$("#dot_js_button").click(function() {
  $("#hide1").click();
  $("#mixed").click();
  $("#male").click();
});
