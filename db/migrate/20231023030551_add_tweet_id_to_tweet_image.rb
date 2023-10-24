# frozen_string_literal: true

class AddTweetIdToTweetImage < ActiveRecord::Migration[7.0]
  def change
    add_reference :tweet_images, :tweet, foreign_key: true
  end
end
