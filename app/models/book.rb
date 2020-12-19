# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  paginates_per 10
  has_many :comments, as: :commentable
end
