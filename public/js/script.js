$.ready = function() {

  $('#pet-projects').hide();

  $('nav ul li a').live('click', function() {
    $('nav ul li a').removeClass('active');
    $(this).addClass('active');
    $('.portfolio .section').hide();
    var section = $(this).attr('data-section');
    $('#' + section).show();
    return false;
  });

  $('.flexslider').flexslider({
    slideshowSpeed: 10000,
    pauseOnHover: true
  });

  var $buoop = {}
  $buoop.ol = window.onload;
  window.onload=function(){
    try {if ($buoop.ol) $buoop.ol();}catch (e) {}
    var e = document.createElement("script");
    e.setAttribute("type", "text/javascript");
    e.setAttribute("src", "http://browser-update.org/update.js");
    document.body.appendChild(e);
  }

}
