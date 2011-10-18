require 'capistrano/ext/multistage'


set :stages, %w(production)

namespace :deploy do

  before 'deploy:update', 'deploy:pre_update_code'

  after 'deploy', 'deploy:cleanup'
  after 'deploy:update_code', 'deploy:post_update_code'

  task :start do ; end
  task :stop do ; end
  task :restart do; end 

  task :pre_update_code do
    run 'forever stop code/scraper.js'
  end

  task :post_update_code do
    run "cd #{current_path} &&  forever start -o #{current_path}/log/scraper.log -e #{current_path}/scraper.err.log code/scraper.js --log"
  end


end
