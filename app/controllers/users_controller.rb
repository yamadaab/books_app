# frozen_string_literal: true

class UsersController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
