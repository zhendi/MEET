# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

MEET::Application.load_tasks

desc"create some initial data"
task :initialdata do |t|
  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", :setup ]
end

desc "Setup system data"
task :setup => :environment do
  puts "Create system user"
  #u = User.new( :login => "root", :password => "password", :email => "root@example.com", :name => "管理員")
  #u.is_admin = true
  #u.save!
end
