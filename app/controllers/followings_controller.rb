# frozen_string_literal: true

class FollowingsController < ApplicationController
  def index
    @followings = User.find(params[:user_id]).followings
  end
end
