# frozen_string_literal: true

class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :text, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
