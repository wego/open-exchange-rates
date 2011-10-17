set :application, 'open-exchange-rates'
set :repository,  'git@github.com:wego/open-exchange-rates.git'
set :deploy_to, "/var/node_apps/#{application}"
set :branch, 'master'
set :scm, :git
set :deploy_via, :remote_cache

set :user, 'deploy'
set :runner, 'deploy'
set :use_sudo, false

set :normalize_asset_timestamps, false

server '122.248.251.172', :app, :db, :web, :primary => true
