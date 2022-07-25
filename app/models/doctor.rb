# frozen_string_literal: true

class Doctor < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :university, presence: true, length: { maximum: 50 }
end
