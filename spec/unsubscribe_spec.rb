require_relative 'spec_helper'

describe 'unsubscribe a user' do
  let(:subscriber_id) { 123 }
  let(:email_name) { :some_email }

  before(:all) do
    @token = Tldr::TokenGenerator.new(subscriber_id, email_name).token
    @subscription = mock
    @subscription.stubs(:subscriber_id=).with(subscriber_id.to_s)
    @subscription.stubs(:email_name=).with(email_name)
  end

  it 'adds the subscriber to the CancelledSubscribers' do
    Tldr::CancelledSubscription.expects(:where).returns([])
    Tldr::CancelledSubscription.expects(:new).returns(@subscription)
    @subscription.expects(:save!).returns(true)
    Tldr.unsubscribe @token
  end

  it 'does not try to insert an invalid token' do
    Tldr::CancelledSubscription.expects(:new).never
    Tldr.unsubscribe 'blah'
  end

  it 'does not unsubscribe twice' do
    Tldr::CancelledSubscription.expects(:where).returns([@subscription])
    Tldr.unsubscribe @token
  end
end
