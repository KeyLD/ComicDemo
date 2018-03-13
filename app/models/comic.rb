class Comic < ApplicationRecord
  mount_uploader :image, ImageUploader

  acts_as_commentable

  validates_presence_of :name, :time, :image, :type_id, :country_id, :theme_id
  has_many :comments
  belongs_to :type
  belongs_to :country
  belongs_to :theme
end