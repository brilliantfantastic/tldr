require_relative 'spec_helper'

describe Tldr::TokenGenerator do
  it 'generates a url safe token for a given user and email' do
    token = Tldr::TokenGenerator.new(123, :some_email).token
    token.wont_be_nil
    token.wont_match /^\s*$/
  end

  it 'generates the same token for the same user and email' do
    token1 = Tldr::TokenGenerator.new(123, :some_email).token
    token2 = Tldr::TokenGenerator.new(123, :some_email).token
    token1.must_equal token2
  end

  describe '.decode' do
    it 'returns a hash of values based on the token' do
      subscriber_id = 123
      email_name = :some_email
      token = Tldr::TokenGenerator.new(subscriber_id, email_name).token
      values = Tldr::TokenGenerator.decode(token)
      values[:subscriber_id].must_equal subscriber_id.to_s
      values[:email_name].must_equal email_name
    end

    it 'handles a non base 64 token' do
      values = Tldr::TokenGenerator.decode 'blah'
      values.must_be_nil
    end
  end
end
