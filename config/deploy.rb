# config valid only for current version of Capistrano
lock '3.8.0'

# config/deploy.rb
set :rbenv_type, :user
set :rbenv_ruby, '2.3.3'

set :application, 'AdventureMap'
set :repo_url, 'git@github.com:CraftAcademyLabs/adventure_map_back_end.git'

set :branch, ENV['BRANCH']

set :deploy_to, ENV['APP_PATH']

# Default value for :linked_files is []
set :linked_files, %w{
  config/database.yml config/application.yml config/secrets.yml .env
}

# Default value for linked_dirs is []
set :linked_dirs, %w{
  log tmp/pids tmp/cache tmp/sockets vendor/bundle
  public/system public/uploads public/.well-known
}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
