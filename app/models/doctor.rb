# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_secure_password
  has_many :consultations, dependent: :delete_all

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :university, presence: true, length: { maximum: 50 }
end
