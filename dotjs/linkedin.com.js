spam_this_function = function() {
  $("li.card.guest.shrunken-card").hide();
  setTimeout(spam_this_function, 2000)
};
spam_this_function();
