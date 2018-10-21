Clearance.configure do |config|
  # prevents clearance from loading its own routes so it doesn't conflict with routes we have listed
  config.routes = false
  config.mailer_sender = "reply@example.com"
  config.rotate_csrf_on_sign_in = true
end
