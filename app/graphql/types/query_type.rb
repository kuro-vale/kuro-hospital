# frozen_string_literal: true

module Types
  # Expose query types
  class QueryType < Types::BaseObject
    description 'Self descriptive.'
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :current_doctor, Doctors::DoctorType, null: false, description: 'Get logged doctor'

    field :doctors, Doctors::DoctorType.collection_type, null: false,
                                                         description: 'Query to find all doctors' do
      argument :page, Integer, required: false, description: 'Select page to show.'
      argument :search, String, required: false, description: 'Filter result by name or username.'
    end

    field :drugs, Drugs::DrugType.collection_type, null: false,
                                                   description: 'Query to find all drugs' do
      argument :page, Integer, required: false, description: 'Select page to show.'
      argument :search, String, required: false, description: 'Filter result by brand name or generic name.'
    end

    field :patients, Patients::PatientType.collection_type, null: false,
                                                            description: 'Query to find all patients' do
      argument :page, Integer, required: false, description: 'Select page to show.'
      argument :search, String, required: false, description: 'Filter result by name.'
    end

    field :consultations,
          Consultations::ConsultationType.collection_type,
          null: false, description: 'Query to find all consultations' do
      argument :page, Integer, required: false, description: 'Select page to show.'
      argument :search, String, required: false, description: 'Filter results.'
    end

    def doctors(page: nil, search: nil)
      Doctor.where("name LIKE '%#{search}%' OR username LIKE '%#{search}%'").page(page).per(20).includes(:consultations)
    end

    def drugs(page: nil, search: nil)
      Drug.where("brand_name LIKE '%#{search}%' OR generic_name LIKE '%#{search}%'").page(page).per(20)
          .includes(:consultations)
    end

    def patients(page: nil, search: nil)
      Patient.where("name LIKE '%#{search}%'").page(page).per(20).includes(:consultations)
    end

    def consultations(page: nil, search: nil)
      Consultation.where("diagnosis LIKE '%#{search}%' OR `procedure` LIKE '%#{search}%'").page(page).per(20)
                  .includes(%i[doctor patient drug])
    end

    def current_doctor
      raise Exceptions::AuthenticationError, 'Not Authenticated, please login' unless context[:current_user]

      context[:current_user]
    end
  end
end
