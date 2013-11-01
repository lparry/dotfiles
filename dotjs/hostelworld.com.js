stop_fucking_my_middleclicks = function() {
  $('a[class=gotoMicrosite]').removeClass('gotoMicrosite');
  setTimeout(stop_fucking_my_middleclicks, 2000)
};
stop_fucking_my_middleclicks();
