setup_stripe = function() {
  if (typeof Stripe !== 'undefined')
  {
    Stripe.setPublishableKey('pk_test_IIvnJ7YTt0yZk0uKrRN5f4Ss');
    modal();
  
 }
}

var stripeResponseHandler = function(status, response) {
  var $form = $('#payment-form');

  if (response.error && response.error.message.indexOf("An unexpected error has occurred") === -1 ) {
    // Show the errors on the form
    $form.find('.payment-errors').text(response.error.message);
    $form.find('button').prop('disabled', false);
    return false;
  } else if (isNaN($('#amount_field').val()) || parseInt($('#amount_field').val()) <= 0 || parseInt($('#amount_field').val()) > 5000) {
    $form.find('.payment-errors').text("Please enter a positive amount less than 5000");
    $form.find('button').prop('disabled', false);
    return false;
  } 

  else {
    // token contains id, last4, and card type
    var token = response.id;
    var amount = response.amount;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));
    // and submit
   $form.get(0).submit();
  }
};

modal = function(){
    $('#payment-form').submit(function(event) {
      var $form = $('#payment-form');
      // Disable the submit button to prevent repeated clicks
      $form.find('button').prop('disabled', true);
      Stripe.card.createToken($form, stripeResponseHandler);
      return false;
    });
}


$(window).load(function() {
   setup_stripe();
 });

$(document).on('page:load', setup_stripe);