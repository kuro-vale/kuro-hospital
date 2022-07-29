# frozen_string_literal: true

module Exceptions
  class AuthenticationError < StandardError; end
  class InvalidUsername < AuthenticationError; end
end
