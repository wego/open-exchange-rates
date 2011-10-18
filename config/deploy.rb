require 'capistrano/ext/multistage'


set :stages, %w(production)

namespace :deploy do

  before 'deploy:update', 'deploy:pre_update_code'

  after 'deploy', 'deploy:cleanup'
  after 'deploy:symlink', 'deploy:post_update_symlink'

  task :start do ; end
  task :stop do ; end
  task :restart do; end 

  task :pre_update_code do
    run 'forever stop code/scraper.js'
  end

  task :post_update_symlink do
    run "cd #{current_path} &&  forever start -o #{current_path}/log/scraper.log -e #{current_path}/log/scraper_err.log code/scraper.js --log"
  end


end
