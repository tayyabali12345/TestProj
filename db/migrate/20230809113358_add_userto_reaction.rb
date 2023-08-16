class AddUsertoReaction < ActiveRecord::Migration[5.2]
  def change
    add_reference :reactions, :user, foreign_key: true
  end
end
