

renderKnob = function() { 
  $(".dial").knob({
    'draw' : function () { 
      $(this.i).val(this.cv + '%');
    }
  });
};

$(window).load(function() {
   renderKnob();
});

$(document).on('page:load', renderKnob);

