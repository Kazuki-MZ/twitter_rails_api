# frozen_string_literal: true

class CreateTweetImages < ActiveRecord::Migration[7.0]
  def change
    create_table :tweet_images, &:timestamps
  end
end
