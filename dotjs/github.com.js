// swap github logo with trollface
$('a[class^=header-logo-]').html(
    $('<img>')
        .attr('src', '//bit.ly/ghD24e')
        .css({'width': 'auto', 'height': '22px', 'margin-left': '-30px'})
    );

$("a.build-status-details").attr('target', '_blank')
