
  
Rails.configuration.stripe = {
  :publishable_key => 'pk_test_51K59BaCUBTCvIzzgfAmTygus1fa1EnSsqNNDbeGHRL4MCfnduO4j2YYc2FwtvUhCIjpVXLHm9KAjI6TXasaliA4l006JxHmr7X',
  :secret_key      => 'sk_test_51K59BaCUBTCvIzzgRnEOuG26Yhvb8FizGtSHEyGIhUJSOF5smWSCEi23wg0LJ7eQM6zeVzEsLtdRmWSClJFuTdeP007s6PW42i'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
