
$("body").append('<div id="dot_js_button">Filter star alliance</div>');
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
  $(".clear-all-airlines").click();
  $("#airline_JP").click();
  $("#airline_A3").click();
  $("#airline_AC").click();
  $("#airline_CA").click();
  $("#airline_AI").click();
  $("#airline_NZ").click();
  $("#airline_NH").click();
  $("#airline_OZ").click();
  $("#airline_OS").click();
  $("#airline_AV").click();
  $("#airline_SN").click();
  $("#airline_CM").click();
  $("#airline_OU").click();
  $("#airline_MS").click();
  $("#airline_ET").click();
  $("#airline_BR").click();
  $("#airline_LO").click();
  $("#airline_LH").click();
  $("#airline_SK").click();
  $("#airline_ZH").click();
  $("#airline_SQ").click();
  $("#airline_SA").click();
  $("#airline_LX").click();
  $("#airline_TP").click();
  $("#airline_TG").click();
  $("#airline_TK").click();
  $("#airline_UA").click();
});
