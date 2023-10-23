# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true

  include DeviseTokenAuth::Concerns::User
  has_many :tweets, dependent: :destroy
end
