# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'

# GraphQL gem
gem 'graphql'
# GraphiQL playground
gem 'graphiql-rails'

# Use sqlite as the database for Active Record
gem 'sqlite3-ruby'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Authentication gems
gem 'bcrypt'
gem 'jwt'

# Pagination
gem 'graphql-pagination'
gem 'kaminari-activerecord'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Rails lint
  gem 'rubocop'
  gem 'rubocop-graphql'
  gem 'rubocop-rails'
end
