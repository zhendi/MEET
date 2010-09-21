load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks


set :user, "wuhy80"
task :stamp, :hosts => "www.jameswu.me" do
  run "touch /home/wuhy80/touched"
end

