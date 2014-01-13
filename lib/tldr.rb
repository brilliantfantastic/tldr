require_relative 'tldr/version'
require_relative 'tldr/subscriber'
require_relative 'tldr/cancelled_subscription'
require_relative 'tldr/token_generator'

module Tldr
  def self.unsubscribe(token)
    values = Tldr::TokenGenerator.decode(token)
    if values
      conditions = {subscriber_id: values[:subscriber_id],
                       email_name: values[:email_name]}
      subscription = Tldr::CancelledSubscription.where(conditions).first
      unless subscription
        subscription = Tldr::CancelledSubscription.new
        subscription.subscriber_id = values[:subscriber_id]
        subscription.email_name = values[:email_name]
        subscription.save!
      end
      subscription
    end
  end
end
