module Tldr
  module Subscriber
    def self.included(klass)
      klass.class_eval do
        include InstanceMethods
      end
    end

    module InstanceMethods
      def subscribed_to?(email)
        !Tldr::CancelledSubscription.exists?(subscriber_id: id, email_name: email)
      end
    end
  end
end
