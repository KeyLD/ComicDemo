class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :comic

  validates_presence_of :content, :user_id

end
