# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    current_user.active_relationships.create(target_user_id: params[:user_id])
    redirect_to user_path(params[:user_id])
  end

  def destroy
    current_user.active_relationships.find_by(target_user_id: params[:user_id]).destroy
    redirect_to user_path(params[:user_id])
  end
end
