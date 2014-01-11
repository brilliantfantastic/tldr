require 'active_record'

module Tldr
  class CancelledSubscription < ActiveRecord::Base
    attr_accessible :subscriber_id, :email_name
  end
end
