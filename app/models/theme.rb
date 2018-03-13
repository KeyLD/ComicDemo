class Theme < ApplicationRecord
  has_many :comics
  validates_presence_of :name
end
