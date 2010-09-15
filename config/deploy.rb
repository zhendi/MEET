set :application, "meet"
set :repository,  "http://svn2.xp-dev.com/svn/meet/trunk/"

set :scm, :subversion

role :web, "blog.jameswu.me"                          # Your HTTP server, Apache/etc
role :app, "blog.jameswu.me"                          # This may be the same as your `Web` server
role :db,  "blog.jameswu.me", :primary => true # This is where Rails migrations will run
role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end