// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as bootstrap from "bootstrap"


document.addEventListener('DOMContentLoaded', function() {
    var stripe = Stripe('<%= Rails.application.credentials.dig(:stripe, :publishable_key) %>');
    var elements = stripe.elements();
  
    var card = elements.create('card');
  
    card.mount('#card-element');
  
    var form = document.getElementById('payment-form');
  
    form.addEventListener('submit', function(event) {
      event.preventDefault();
  
      stripe.createToken(card).then(function(result) {
        if (result.error) {
          // Inform the user if there was an error.
          var errorElement = document.getElementById('card-errors');
          errorElement.textContent = result.error.message;
        } else {
          // Send the token to your server.
          stripeTokenHandler(result.token);
        }
      });
    });
  });
  
  function stripeTokenHandler(token) {
    var form = document.getElementById('payment-form');
   var hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
   hiddenInput.setAttribute('name', 'stripeToken');
     hiddenInput.setAttribute('value', token.id);
  form.appendChild(hiddenInput);
  
    form.submit();
  }
  