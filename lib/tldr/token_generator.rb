require 'base64'

module Tldr
  class TokenGenerator
    attr_reader :token

    def initialize(subscriber_id, email_name)
      @subscriber_id = subscriber_id
      @email_name = email_name
      generate
    end

    def self.decode(token)
      result = Base64.urlsafe_decode64 token
      values = result.split '|'
      {subscriber_id: values[0], email_name: values[1].to_sym} if values.length == 2
    end

    private

    def generate
      @token = Base64.urlsafe_encode64 "#{@subscriber_id}|#{@email_name}"
    end
  end
end
