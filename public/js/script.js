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
    animation: "slide"
  });

}
