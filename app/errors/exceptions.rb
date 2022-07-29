# frozen_string_literal: true

module Exceptions
  class AuthenticationError < StandardError; end
  class AuthorizationError < AuthenticationError; end
  class InvalidUsername < AuthenticationError; end
end
