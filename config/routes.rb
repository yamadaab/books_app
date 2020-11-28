# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations" }
  resources :users, only: [:index, :edit, :show, :update, :destroy] do
    resource :follow
    resources :followings
    resources :followers
  end
  resources :books
end
