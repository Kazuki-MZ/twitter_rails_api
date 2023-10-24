# frozen_string_literal: true

class TweetImage < ApplicationRecord
  belongs_to :tweet, optional: true

  has_one_attached :image
end
