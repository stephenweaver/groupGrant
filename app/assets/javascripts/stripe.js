setup_stripe = function() {
  if (typeof Stripe !== 'undefined')
  {
       console.log("wasup");
   Stripe.setPublishableKey('pk_test_IIvnJ7YTt0yZk0uKrRN5f4Ss');
   console.log(Stripe);
   // $('#payment-form').on('shown.bs.modal', function (e) {
   //    console.log("modal launched");
      modal();
    // });
  
 }
}

var stripeResponseHandler = function(status, response) {
  var $form = $('#payment-form');

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
    $form.append($('<input type="text" name="stripeToken" />').val(token));
    // and submit
   $form.get(0).submit();
   console.log($form.get(0));
  }
};

modal = function(){
  console.log("hey work?");
  jQuery(function($) {
    $('#payment-form').submit(function(event) {
      var $form = $('#payment-form');
      console.log("will this work?");
      // Disable the submit button to prevent repeated clicks
      $form.find('button').prop('disabled', true);
console.log("run jquery1");
      Stripe.card.createToken($form, stripeResponseHandler);
      
      console.log("run jquery2");
      return false;
    });
  });
}




 

$(window).load(function() {
   setup_stripe();
 });

$(document).on('page:load', setup_stripe);

