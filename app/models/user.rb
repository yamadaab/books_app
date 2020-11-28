# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :avatar
  has_many :active_relationships, class_name: "Follow", foreign_key: "user_id"
  has_many :passive_relationships, class_name: "Follow", foreign_key: "target_user_id"
  has_many :followings, through: :active_relationships, source: :target_user
  has_many :followers, through: :passive_relationships, source: :user

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  def self.find_for_github_oauth(auth, signed_in_resource = nil)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.name = auth.info.name
      user.email = User.dummy_email(auth)
      user.password = Devise.friendly_token[0, 20]
      # user.skip_confirmation!
    end
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

  def self.create_unique_string
    SecureRandom.uuid
  end
end
