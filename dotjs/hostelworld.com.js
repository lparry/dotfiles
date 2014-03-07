stop_fucking_my_middleclicks = function() {
  $('a[class=gotoMicrosite]').removeClass('gotoMicrosite');
  setTimeout(stop_fucking_my_middleclicks, 2000)
};

dorms_only = function() {
  $("#hide1").click();
  $("#mixed").click();
  $("#male").click();
};

stop_fucking_my_middleclicks();


$(document).ready ( function(){
  setTimeout(dorms_only, 2000)
});
