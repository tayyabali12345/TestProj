class Comment < ApplicationRecord
  has_many :reactions, as: :likeable
  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { minimum: 5, maximum: 100 }
end
