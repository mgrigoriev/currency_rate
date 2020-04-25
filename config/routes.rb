# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :forced_rates, only: [:new, :edit, :update, :create]

    root to: 'forced_rates#edit'
  end

  root to: 'home#index'

  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'
end
