class Country < ApplicationRecord
  has_many :comics
  validates_presence_of :name
end
