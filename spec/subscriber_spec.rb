require_relative 'spec_helper'

describe Tldr::Subscriber do
  class User
    include Tldr::Subscriber
    attr_reader :id

    def initialize(attrs={})
      @id = attrs[:id]
    end
  end

  describe '#subscribed_to?' do
    it 'returns true if the subscription exists for the subscriber' do
      Tldr::CancelledSubscription.expects(:exists?).with(subscriber_id: 123, email_name: :some_email).returns false
      user = User.new(id: 123)
      user.subscribed_to?(:some_email).must_equal true
    end

    it 'returns false if the subscriber has cancelled' do
      Tldr::CancelledSubscription.expects(:exists?).with(subscriber_id: 123, email_name: :some_other_email).returns 1
      user = User.new(id: 123)
      user.subscribed_to?(:some_other_email).must_equal false
    end
  end
end
