# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :body, String, null: false
    # field :user_id, Integer
    field :user, Types::UserType, null: true  # Define the user field
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def user
      User.find(object.user_id)  # Replace with your actual logic to fetch the user
    end
  end
end
