# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations" }
  resources :users, only: [:index, :edit, :show, :update, :destroy] do
    resource :follow, only: [:create, :destroy]
    resources :followings, only: [:index]
    resources :followers, only: [:index]
  end
  resources :books
end
