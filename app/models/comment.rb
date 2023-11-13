# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :context, presence: true
  belongs_to :user
  belongs_to :tweet
end
