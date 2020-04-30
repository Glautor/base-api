source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring', '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'rspec-rails', '~> 4.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'rails', '~> 6.0.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3.3'
gem 'jbuilder', '~> 2.10.0'
gem 'bcrypt', '~> 3.1.13'
gem 'jwt', '~> 2.2.1'
gem 'fast_jsonapi', '~> 1.5'
gem 'faker', '~> 2.11.0'
gem 'swagger-docs', '~> 0.2.7'
gem 'logger', '~> 1.4.2'
gem 'rack-cors', '~> 1.1.1'
gem 'rack-attack', '~> 6.2.2'
gem 'pry', '~> 0.12.2'
gem 'will_paginate', '~> 3.1.0'
gem 'parser', '~> 2.4'
gem 'i18n', '~> 1.7.0'
gem 'rswag-api', '~> 2.3.1'
gem 'rswag-ui', '~> 2.3.1'