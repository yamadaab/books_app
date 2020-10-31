# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash = {})
    hash[:uid] = User.create_unique_string
    super
  end

  private
    def after_update_path_for(resource)
      user_path (resource)
    end
end
