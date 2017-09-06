Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1632349790403273', 'ad940a279de6e3030d94a6ff4fb28452',
           scope: 'email',
           info_fields: 'email,first_name,last_name'
end