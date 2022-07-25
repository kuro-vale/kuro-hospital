# frozen_string_literal: true

Rails.application.routes.draw do
  root to: redirect('/graphiql')
  post '/graphql', to: 'graphql#execute'
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
end
