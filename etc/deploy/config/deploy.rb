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
      execute "ln -fs #{fetch(:deploy_to)}/current/public /web/#{fetch(:fqdn)}/public"
    end
  end

  after :create_public_symlink, :restart_process do
    on roles(:all) do |host|
      systemd_dir = "#{ENV['HOME']}/.config/systemd/user"
      execute <<-CMD
        mkdir -p #{systemd_dir}
        cp #{release_path}/etc/systemd/user/homepage.service #{systemd_dir}/homepage.service
        systemctl --user daemon-reload
        systemctl --user enable homepage.service
        systemctl --user restart homepage.service
      CMD
    end
  end
end
