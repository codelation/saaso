require "rails_helper"

module Saaso

  describe Plan, "#interval_length" do

    it "should return the length of the subscription" do
      @plan = build(:plan)
      expect(@plan.interval_length).to eq(1.month)

      @plan.interval_count = 6
      expect(@plan.interval_length).to eq(6.months)

      @plan.interval_count = 1
      @plan.interval = :year
      expect(@plan.interval_length).to eq(1.year)
    end

  end

  describe Plan, "#trial_length" do

    it "should return the length of the trial" do
      @plan = build(:plan)
      expect(@plan.trial_length).to eq(14.days)

      @plan = build(:yearly_plan)
      expect(@plan.trial_length).to eq(30.days)
    end

  end

end
