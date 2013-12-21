(function() {
  var $j;

  $j = jQuery;

  $j(function() {});

  $(function() {
    var BV, s;
    BV = new $.BigVideo({
      useFlashForFirefox: true
    });
    BV.init();
    if (Modernizr.touch) {
      BV.show("media/images/background-dock.jpg");
    } else {
      BV.show("media/videos/sexy.mp4", {
        ambient: true,
        altSource: "media/videos/sexy.ogv"
      });
    }
    return s = skrollr.init();
  });

}).call(this);
