# frozen_string_literal: true

class Patient < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :age, presence: true, numericality: { greater_than: 18, less_than: 90 }
  validates :gender, presence: true, inclusion: { in: %w[M F X] }
end
