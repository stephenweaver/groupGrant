setup = function() {
   Stripe.setPublishableKey('pk_test_IIvnJ7YTt0yZk0uKrRN5f4Ss');
   console.log(Stripe);
}

var stripeResponseHandler = function(status, response) {
  var $form = $('#payment-form');
console.log("what the hell");
  if (response.error) {
    // Show the errors on the form
    $form.find('.payment-errors').text(response.error.message);
    $form.find('button').prop('disabled', false);
  } else {
    // token contains id, last4, and card type
    var token = response.id;
    var amount = response.amount;
    console.log(token);
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));
    // and submit
   $form.get(0).submit();
  }
};

jQuery(function($) {
  $('#payment-form').submit(function(event) {
    var $form = $(this);
    console.log("will this work?");
    // Disable the submit button to prevent repeated clicks
    $form.find('button').prop('disabled', true);

    Stripe.card.createToken($form, stripeResponseHandler);

    // Prevent the form from submitting with the default action
    return false;
  });
});


$(window).load(function() {
   setup();
});
$(document).on('page:load', setup);
