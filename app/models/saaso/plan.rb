module Saaso
  class Plan < ActiveRecord::Base
    scope :active, -> { where(active: true) }

    monetize :price_cents

    validates_presence_of :interval, :interval_count

    scope :active, -> { where(active: true) }

    enum interval: {
      month: 0,
      year:  1
    }

    # Returns the the length of time for the plan's
    # interval used for calculating the subscription's
    # billing cycles and ending dates.
    #
    # Example:
    #
    #   end_date = start_date + plan.interval_length
    #
    # @return [Fixnum, Float]
    def interval_length
      self.interval_count.send(self.interval)
    end

    # Returns the the length of time for the plan's trial period.
    #
    # Example:
    #
    #   trial_end = start_date + plan.trial_length
    #
    # @return [Fixnum, Float]
    def trial_length
      self.trial_period_days.to_i.days
    end
  end
end
