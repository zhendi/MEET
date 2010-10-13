set :application, "meet"

set :repository, "git@github.com:wuhy80/MEET.git" 
set :scm, "git"
ssh_options[:forward_agent] = true

set :deploy_to, "/home/wuhy80/#{application}"
set :use_sudo,  false

role :web, "www.jameswu.me"                         
role :app, "www.jameswu.me"                          
role :db,  "www.jameswu.me", :primary => true 

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
