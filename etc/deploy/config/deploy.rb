# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'homepage'
set :repo_url, 'git@github.com:takkyuuplayer/homepage.git'
set :deploy_to, '/workspace/deployment/homepage'
set :linked_dirs, fetch(:linked_dirs, []).push('vendor/bundle')

namespace :deploy do
  task :make_setup do
    on roles(:all) do |host|
      execute <<-CMD
      . /etc/profile.d/anyenv.sh
      cd #{release_path}
      make install
      CMD
    end
  end

  before :updated, :make_setup
  after :make_setup, :create_public_symlink do
    on roles(:all) do |host|
      execute "ln -s #{release_path}/public /web/homepage/public"
    end
  end
end
