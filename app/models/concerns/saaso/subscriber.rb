module Saaso
  module Subscriber
    extend ActiveSupport::Concern

    included do
      has_many :subscriptions, as: :subscriber
    end

    # Returns whether or not the subscriber has an active subscription.
    # @return [Boolean]
    def active_subscription?
      if self.current_subscription && (self.current_subscription.active? || self.current_subscription.trialing?)
        true
      else
        false
      end
    end

    # The current subscription for the subscriber.
    # @return [Saaso::Subscription]
    def current_subscription
      self.subscriptions.current.first
    end

    # Subscribe the user or organization to a
    # new subscription plan. A new subscription will
    # be created. The old subscription will be ended
    # if there was an active subscription.
    # @param plan [Saaso::Plan]
    # @return [Saaso::Subscription]
    def subscribe_to_plan(plan)
      old_subscription = self.current_subscription
      if old_subscription
        old_subscription.ended_at = Time.now
        old_subscription.canceled!
      end

      new_subscription = Saaso::Subscription.create(plan: plan)
      if plan.trial_length > 0
        new_subscription.trialing!
      else
        new_subscription.active!
      end

      self.subscriptions << new_subscription

      new_subscription
    end
  end
end
