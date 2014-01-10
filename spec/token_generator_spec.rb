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
end
