module Tldr
  module Subscriber
    def self.included(klass)
      klass.class_eval do
        include InstanceMethods
      end
    end

    module InstanceMethods
      def subscribed_to?(email)
        true
      end
    end
  end
end
