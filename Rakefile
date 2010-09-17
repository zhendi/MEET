# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

MEET::Application.load_tasks

desc  "recreate entire database"
task  :recreate do |t|
	Rake::Task["db:drop"].invoke
	Rake::Task["db:create"].invoke
	Rake::Task["db:migrate"].invoke
end
