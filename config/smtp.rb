# SMTP_SETTINGS = {
#   address: ENV.fetch('SMTP_ADDRESS'),
#   authentication: ENV.fetch('SMTP_AUTH'),
#   domain: ENV.fetch('SMTP_DOMAIN'),
#   enable_starttls_auto: ENV.fetch('SMTP_ENABLE_TLS'),
#   password: ENV.fetch('SMTP_PASSWORD'),
#   port: ENV.fetch('SMTP_PORT'),
#   user_name: ENV.fetch('SMTP_USERNAME')
# }

# if ENV['EMAIL_RECIPIENTS'].present?
#   Mail.register_interceptor RecipientInterceptor.new(ENV['EMAIL_RECIPIENTS'])
# end
