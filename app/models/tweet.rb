# frozen_string_literal: true

class Tweet < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_one :tweet_image, dependent: :destroy

  validates :text, presence: true

  def image_url
    tweet_image&.image&.attached? ? url_for(tweet_image.image) : nil
  end
end
