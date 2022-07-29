# frozen_string_literal: true

module Types
  module Patients
    class PatientType < Types::BaseObject
      description 'Patient type.'

      field :age, String, null: false, description: 'Age of the patient.'
      field :gender, String, null: false, description: 'gender of the patient..'
      field :id, ID, null: false, description: 'ID of the patient.'
      field :name, String, null: false, description: 'name of the patient.'
    end
  end
end
