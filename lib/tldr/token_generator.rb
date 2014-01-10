require 'base64'

module Tldr
  class TokenGenerator
    attr_reader :token

    def initialize(subscriber_id, email_name)
      @subscriber_id = subscriber_id
      @email_name = email_name
      generate
    end

    private

    def generate
      @token = Base64.urlsafe_encode64 "#{@subscriber_id}#{@email_name}"
    end
  end
end
