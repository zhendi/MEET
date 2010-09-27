source 'http://rubygems.org'

gem 'rails', '3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', :require => 'sqlite3'
# Use unicorn as the web server
# gem 'unicorn'

# 分页组件，还是非常有用的
gem 'will_paginate', "~> 3.0.pre2"
# gem 'formtastic', '~> 1.1.0'
# 身份认证组件.http://github.com/plataformatec/devise
# 个人认为，不需要使用这个组件。事实上，最好是什么组件都不使用，每个组件都有他自己的一些规则
gem 'devise'
# 

gem 'newrelic_rpm'
# calc the code metrics
gem 'metric_fu'
# upload file's plugin
gem 'paperclip'

# Deploy with Capistrano
gem 'capistrano'

gem 'acts-as-taggable-on'
# 在Model文件中添加数据库的注释信息，非常有用
gem 'annotate'

# Admin-Data
gem 'admin_data'

group :development do
  gem 'rspec-rails', '2.0.0.beta.18'
end

group :production do
  gem 'mysql', '>= 2.8.1'
end

group :test do
  gem 'rspec', '2.0.0.beta.18'
end

# To use debugger. 这个目前安装不了，依赖于LINECACHE模块，但是这个模块不支持1.9x系列Ruby
# gem 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'aws-s3', :require => 'aws/s3'
