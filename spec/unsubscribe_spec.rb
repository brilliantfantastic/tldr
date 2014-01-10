require_relative 'spec_helper'

describe 'unsubscribe a user' do
  let(:subscriber_id) { 123 }
  let(:email_name) { :some_email }

  before(:all) do
    @token = Tldr::TokenGenerator.new(subscriber_id, email_name).token
  end

  it 'adds the subscriber to the CancelledSubscribers' do
    Tldr::CancelledSubscription.expects(:exists?).returns(false)
    Tldr::CancelledSubscription.expects(:create!).with({subscriber_id: subscriber_id.to_s, email_name: email_name})
    Tldr.unsubscribe @token
  end

  it 'does not try to insert an invalid token' do
    Tldr::CancelledSubscription.expects(:create!).never
    Tldr.unsubscribe 'blah'
  end

  it 'does not unsubscribe twice' do
    Tldr::CancelledSubscription.expects(:exists?).returns(false)
    Tldr::CancelledSubscription.expects(:create!).with({subscriber_id: subscriber_id.to_s, email_name: email_name}).once
    Tldr.unsubscribe @token
    Tldr::CancelledSubscription.expects(:exists?).returns(true)
    Tldr.unsubscribe @token
  end
end
