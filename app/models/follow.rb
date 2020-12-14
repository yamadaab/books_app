# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :target_user, class_name: "User", foreign_key: "target_user_id"

  validates :user_id, uniqueness: { scope: :target_user_id }
end
