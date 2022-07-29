# frozen_string_literal: true

class Drug < ApplicationRecord
  validates :brand_name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :generic_name, presence: true, uniqueness: true, length: { maximum: 500 }
  validates :laboratory, presence: true, length: { maximum: 50 }
end
