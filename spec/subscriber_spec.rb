require_relative 'spec_helper'

describe Tldr::Subscriber do
  class User
    include Tldr::Subscriber
  end

  describe '#subscribed_to?' do
    it 'returns true if the subscription exists for the subscriber' do
      user = User.new
      user.subscribed_to?(:some_email).must_equal true
    end
  end
end
