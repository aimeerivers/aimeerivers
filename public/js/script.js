var Flexslider = (
  function() {
    var self = {
      started: [],

      init: function(element) {
        if(self.started.indexOf(element) < 0) {
          self.started.push(element);
          self.start(element);
        }
      },

      start: function(element) {
        $('#' + element).flexslider({
          slideshowSpeed: 1000,
          animation: 'slide'
        });
      }
    };

    return self;
  }
)();

var Navigation = (
  function() {
    var self = {
      elem: null,
      section: null,

      init: function() {
        $('nav ul li a').live('click', function(event) {
          self.activate($(this));
          return false;
        });
        return self;
      },

      activate: function(element) {
        self.elem = element;
        self.section = self.elem.attr('data-section');

        self.hideTabs();
        self.showThisTab();

        self.hideContent();
        self.showThisContent();

        self.startSlider();
        return false;
      },

      hideTabs: function() {
        $('nav ul li a').removeClass('active');
      },

      showThisTab: function() {
        self.elem.addClass('active');
      },

      hideContent: function() {
        $('.portfolio .section').hide();
      },

      showThisContent: function() {
        $('#' + self.section).show();
      },

      startSlider: function() {
        Flexslider.init(self.section);
      }
    };

    return self;
  }
)();

$.ready = function() {

  $('#pet-projects').hide();

  Navigation.init().activate($('nav ul li:first-child a'));
}
