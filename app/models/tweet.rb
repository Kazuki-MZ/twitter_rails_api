# frozen_string_literal: true

class Tweet < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_one :tweet_image, dependent: :destroy

  validates :text, presence: true
end
