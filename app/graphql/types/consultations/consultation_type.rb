# frozen_string_literal: true

module Types
  module Consultations
    class ConsultationType < Types::BaseObject
      description 'Consultation type.'

      field :diagnosis, String, null: false, description: 'Diagnosis of the patient.'
      field :doctor, Types::Doctors::DoctorType, null: false, description: 'Doctor that made the consultation.'
      field :drug, Types::Drugs::DrugType, null: false, description: 'Drug prescribed by the doctor'
      field :id, ID, null: false, description: 'ID of the consultation.'
      field :patient, Types::Patients::PatientType, null: false, description: 'Patient of the consultation.'
      field :procedure, String, null: false, description: 'Procedure made by the doctor.'
    end
  end
end
