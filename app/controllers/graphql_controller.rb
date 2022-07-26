# rubocop:disable Metrics/MethodLength
# frozen_string_literal: true

# post /grapqhl
class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      session:,
      current_user:
    }
    result = KuroHospitalSchema.execute(query, variables:, context:, operation_name:)
    render json: result
  rescue StandardError => e
    handle_errors(e)
  end

  private

  def current_user
    return unless session[:token]

    token = session[:token]
    decoded_token = JWT.decode(token, ENV.fetch('HMAC_SECRET'), true, { algorithm: 'HS256' })
    Doctor.find(decoded_token[0]['sub'])
  rescue JWT::DecodeError
    nil
  end

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_errors(error)
    logger.error error.backtrace.join("\n")

    render json: { errors: [{ message: error.message }], data: {} },
           status: :internal_server_error
  end
end

# rubocop:enable Metrics/MethodLength
