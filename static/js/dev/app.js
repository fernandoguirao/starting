(function() {
  var $j;

  $j = jQuery;

  $j(function() {
    return $j('.from-left,.from-right,.from-alpha').each(function() {
      return $j(this).addClass('play');
    });
  });

}).call(this);
