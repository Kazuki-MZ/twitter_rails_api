# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :nickname, null: false
      t.string :bio
      t.string :location
      t.string :website
      t.date :date_of_birth
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
