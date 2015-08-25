// function to wait until document is ready before running
$(document).ready(function() {
	// Lets stripe know who we are by using the stripe key for publish
	Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
	// Watch for a form submission (id added to form) :
	$("#form-submit-btn").click(function(event) {
		event.preventDefault();
		// disables button so cant be clicked twice
		$('input[type=submit]').prop('disabled', true);
		var error = false;
		// grabing values of variables using jquery
		var ccNum = $('#card_number').val(),
			cvcNum = $('#card_code').val(),
			expMonth = $('#card_month').val(),
			expYear = $('card_year').val();

		if (!error) {
			// Get the Stripe token:
			Stripe.createToken({
				number: ccNum,
				cvc: cvcNum,
				exp_month: expMonth,
				exp_year: expYear
			}, StripeResponseHandler);
		}

		return false;
	}); // form submission

	function stripeResponseHandler(status, response) {
		// Get a reference to the form
		var f = $("#new_user");

		// Get the token from the stripe response:
		var token = resonse.id;

		// Add the token to the form:
		f.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />');

		// Submit the form
		f.get(0).submit();
	}
)};