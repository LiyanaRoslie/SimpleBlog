class Article < ApplicationRecord
  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :user

  paginates_per 5

  default_scope -> { order(updated_at: :desc) } 
end
