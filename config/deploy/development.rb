server ENV['SERVER'], user: ENV['DEPLOY_USER'], roles: %w{web db app}
set :ssh_options, forward_agent: true
set :rails_env, 'production'
