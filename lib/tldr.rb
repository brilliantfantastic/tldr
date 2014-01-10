require_relative 'tldr/subscriber'
require_relative 'tldr/cancelled_subscription'
require_relative 'tldr/token_generator'

module Tldr
  def self.unsubscribe(token)
    values = Tldr::TokenGenerator.decode(token)
    if values
      conditions = {subscriber_id: values[:subscriber_id],
                       email_name: values[:email_name]}
      unless Tldr::CancelledSubscription.exists? conditions
        Tldr::CancelledSubscription.create! conditions
      end
    end
  end
end
