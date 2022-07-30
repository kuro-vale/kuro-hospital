# frozen_string_literal: true

class Consultation < ApplicationRecord
  belongs_to :drug
  belongs_to :patient
  belongs_to :doctor

  validates :diagnosis, presence: true, length: { maximum: 500 }
  validates :procedure, presence: true, length: { maximum: 500 }
end
