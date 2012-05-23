var Flexslider = (
  function() {
    var self = {
      elem: null,

      init: function(element) {
        self.elem = $('#' + element);
        self.start();
      },

      start: function() {
        self.elem.flexslider({
          slideshowSpeed: 2000,
          animation: 'slide'
        });
      }
    };

    return self;
  }
)();

$.ready = function() {

  $('#pet-projects').hide();

  $('nav ul li a').live('click', function() {
    $('nav ul li a').removeClass('active');
    $(this).addClass('active');
    $('.portfolio .section').hide();
    var section = $(this).attr('data-section');
    $('#' + section).show();
    Flexslider.init(section);
    return false;
  });

  Flexslider.init('freelance-work');

}
