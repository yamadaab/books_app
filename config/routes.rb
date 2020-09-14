# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    # registrations: "users/registrations",
  }
  # devise_scope :user do
  #   # get "sign_in", to: "users/sessions#new"
  #   # get "sign_out", to: "users/sessions#destroy"
  # end

  resources :users, only: [:edit, :show, :update, :destroy]
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
