class ChangeIdLabels < ActiveRecord::Migration[7.0]
  def change
    change_table :bookings do |t|
      t.rename :users_id, :user_id
      t.rename :venues_id, :venue_id
    end
    change_table :venues do |t|
      t.rename :users_id, :user_id
    end
  end
end
