class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :body, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
end