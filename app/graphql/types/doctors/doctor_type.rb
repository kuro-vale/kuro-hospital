# frozen_string_literal: true

module Types
  module Doctors
    class DoctorType < Types::BaseObject
      description 'Doctor type, used for authentication.'

      field :id, ID, null: false, description: 'ID of the doctor.'
      field :name, String, null: false, description: 'Name of the doctor.'
      field :university, String, null: false, description: 'University where the doctor attended.'
      field :username, String, null: false, description: 'Username of the doctor.'
    end
  end
end
