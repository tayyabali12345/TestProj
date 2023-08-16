class CreateReactionTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      t.boolean :like, :default => false, :null => false
      t.references :likeable, polymorphic: true
      t.timestamps
    end
  end
end
