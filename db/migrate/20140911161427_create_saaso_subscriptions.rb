class CreateSaasoSubscriptions < ActiveRecord::Migration
  def change
    create_table :saaso_subscriptions do |t|
      t.belongs_to :plan, index: true
      t.integer :subscriber_id
      t.string :subscriber_type
      t.datetime :trial_ends_at
      t.datetime :current_period_start
      t.datetime :current_period_end
      t.boolean :cancel_at_period_end, default: true
      t.datetime :canceled_at
      t.datetime :ended_at
      t.integer :status

      t.timestamps
    end
  end
end
