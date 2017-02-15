// alternating row colours (ffs the markup sucks)
if (!window.location.pathname.match(/\/item/)) {
  $(".athing").before("<tr class='spacer'></tr>")
  $(".spacer").html("<td colspan=3></td>").css({ "height": "10px" })
  $(".itemlist > tbody > tr:nth-of-type(8n+5), .itemlist > tbody > tr:nth-of-type(8n+6), .itemlist > tbody > tr:nth-of-type(8n+7), .itemlist > tbody > tr:nth-of-type(8n+8)").css({"background-color": "white" })
  $(".itemlist").css({"width": "100%" })
  $(".subtext > a:last-of-type").css({ "color": "rgb(255, 102, 0)"})
}

// 2017 font sizes and style
$(".title").css({"font-family": "-apple-system, BlinkMacSystemFont, sans-serif", "font-size": "18px"})
$(".title > span").css({"font-family": "-apple-system, BlinkMacSystemFont, sans-serif", "font-size": "14px"})
$(".subtext").css({"font-family": "-apple-system, BlinkMacSystemFont, sans-serif", "font-size": "12px", "padding-top": "5px" })
$(".comment").css({"font-family": "-apple-system, BlinkMacSystemFont, sans-serif", "font-size": "16px"})
$(".athing .title:first-of-type").css({ "padding-right": "5px" })
$(".togg").css({ "color": "rgb(255, 102, 0)"})

// kill vote arrows
$(".votearrow").hide();

