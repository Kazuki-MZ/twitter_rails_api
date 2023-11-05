# frozen_string_literal: true

class Profile < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user

  has_one_attached :icon
  has_one_attached :header

  VALID_URL = %r{\Ahttps?://[\w!?+/\-~;.,*&@#$%()\[\]]+\z}
  validates :website, format: { with: VALID_URL }, on: :update, if: -> { website.present? }
  validates :nickname, presence: true

  def header_image_url
    header.attached? ? url_for(header) : nil
  end

  def icon_image_url
    icon.attached? ? url_for(icon) : nil
  end
end
