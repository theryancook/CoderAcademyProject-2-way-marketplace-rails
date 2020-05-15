Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

puts Rails.application.credentials.dig(:stripe, :secret_key)