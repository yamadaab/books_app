# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

    private
      def after_sign_in_path_for(resource)
        user_path(current_user.id) # ログイン後に遷移するpathを設定
      end

      def after_sign_out_path_for(resource)
        new_user_session_path # ログアウト後に遷移するpathを設定
      end

      def after_account_update_path_for(resource)
        user_session_path
      end

 protected
   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :postal_code, :adress, :introduction, :avatar])
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :postal_code, :adress, :introduction, :avatar])
   end
end
