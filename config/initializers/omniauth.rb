Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1632349790403273', 'ad940a279de6e3030d94a6ff4fb28452',
           scope: 'email,public_profile',
           info_fields: 'email,name,first_name,last_name,cover,gender,birthday,locale',
           image_size: 'large'
end