class Reaction < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :user
end
