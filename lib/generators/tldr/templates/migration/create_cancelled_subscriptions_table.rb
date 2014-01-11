class CreateCancelledSubscriptionsTable < ActiveRecord::Migration
  def change
    create_table :cancelled_subscriptions do |t|
      t.integer :subscriber_id, null: false
      t.string :email_name, null: false

      t.timestamps
    end

    add_index :cancelled_subscriptions, [:subscriber_id, :email_name]
  end
end
