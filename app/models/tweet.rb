# frozen_string_literal: true

class Tweet < ApplicationRecord
  include Rails.application.routes.url_helpers

  validates :text, presence: true

  belongs_to :user
  has_one :tweet_image, dependent: :destroy
  has_many :comments, dependent: :destroy

  def image_url
    tweet_image&.image&.attached? ? url_for(tweet_image.image) : nil
  end
end
