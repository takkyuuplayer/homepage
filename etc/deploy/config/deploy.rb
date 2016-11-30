set :application, 'homepage'
set :repo_url, 'https://github.com/takkyuuplayer/homepage.git'
set :deploy_to, '/srv/work/deployment/homepage'
set :linked_dirs, fetch(:linked_dirs, []).push('vendor/bundle')

namespace :deploy do
  task :make_setup do
    on roles(:all) do |host|
      execute <<-CMD
      . /etc/profile.d/anyenv.sh
      cd #{release_path}
      make setup
      CMD
    end
  end

  before :updated, :make_setup
  after :make_setup, :create_public_symlink do
    on roles(:all) do |host|
      execute "ln -fs #{fetch(:deploy_to)}/current/public /web/homepage/public"
    end
  end
end
