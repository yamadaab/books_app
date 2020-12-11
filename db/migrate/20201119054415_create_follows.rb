# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :target_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :follows, [:user_id, :target_user_id], unique: true
  end
end
