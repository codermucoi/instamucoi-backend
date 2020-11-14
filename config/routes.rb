# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :v1, constraints: Routes::ApiConstraint.new(version: 1, default: true) do
    api_guard_routes for: 'users', controller: {
      registration: 'users/registration',
      authentication: 'users/authentication',
      passwords: 'users/passwords',
      tokens: 'users/tokens'
    }
  end
end
