# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'formationDevops'
set :repo_url, 'git@github.com:emilemathieu/formationDevops.git'
set :use_sudo, true

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

####################capistrano-symfony################
# Symfony environment
#set :symfony_env,  "prod"

# Symfony application path
#set :app_path,              "app"

# Symfony web path
#set :web_path,              "web"

# Symfony log path
#set :log_path,              fetch(:app_path) + "/logs"

# Symfony cache path
#set :cache_path,            fetch(:app_path) + "/cache"

# Symfony config file path
#set :app_config_path,       fetch(:app_path) + "/config"

# Controllers to clear
#set :controllers_to_clear, ["app_*.php"]

# Files that need to remain the same between deploys
#set :linked_files,          []

# Dirs that need to remain the same between deploys (shared dirs)
#set :linked_dirs,           [fetch(:log_path), fetch(:web_path) + "/uploads"]

# Dirs that need to be writable by the HTTP Server (i.e. cache, log dirs)
set :file_permissions_paths,         [fetch(:log_path), fetch(:cache_path)]

# Name used by the Web Server (i.e. www-data for Apache)
set :file_permissions_users, ['www-data']

# Name used by the Web Server (i.e. www-data for Apache)
set :webserver_user,        "www-data"

# Method used to set permissions (:chmod, :acl, or :chgrp)
set :permission_method,     :acl

# Execute set permissions
set :use_set_permissions,   true

# Symfony console path
#set :symfony_console_path, fetch(:app_path) + "/console"

# Symfony console flags
#set :symfony_console_flags, "--no-debug"

# Assets install path
#set :assets_install_path,   fetch(:web_path)

# Assets install flags
#set :assets_install_flags,  '--symlink'

# Assetic dump flags
#set :assetic_dump_flags,  ''

#fetch(:default_env).merge!(symfony_env: fetch(:symfony_env))

# ssh config
set :ssh_options, {
 forward_agent: true,
}

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
