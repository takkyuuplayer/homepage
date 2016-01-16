# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'homepage'
set :repo_url, 'git@github.com:takkyuuplayer/homepage.git'
set :deploy_to, '/workspace/cap-deployment'
set :linked_dirs, fetch(:linked_dirs, []).push('vendor/bundle')

namespace :deploy do
  before :updated, :make_setup
  task :make_setup do
    on roles(:all) do |host|
      within release_path do
        execute <<-CMD
        . /etc/profile.d/anyenv.sh
        cd #{release_path}
        make install
        CMD
      end
    end
  end
end
