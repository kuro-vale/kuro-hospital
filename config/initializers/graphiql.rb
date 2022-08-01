# frozen_string_literal: true

GraphiQL::Rails.config.initial_query = "# None of the information in this API has to be taken seriously\n
# This is a stateful API which means your session will be stored in cookies\n
# The model for authentication are doctors, so you have to create a doctor for authentications\n
# Queries don't require a session but mutations does, only register can be done without authentication\n
# The password of all pre-populated doctors are 123\n
# Github https://github.com/kuro-vale/kuro-hospital\n
{
  doctors {
    metadata {
      totalCount
      totalPages
      currentPage
    }
    collection {
      name
      university
      consultations {
        id
      }
    }
  }
}"
GraphiQL::Rails.config.logo = 'kuro-hospital'
