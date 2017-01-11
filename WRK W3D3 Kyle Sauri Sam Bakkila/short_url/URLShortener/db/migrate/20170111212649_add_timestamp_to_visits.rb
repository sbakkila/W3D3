class AddTimestampToVisits < ActiveRecord::Migration[5.0]
  def change
      # add_timestamps :visits
      add_column :visits, :created_at, :datetime
      add_column :visits, :updated_at, :datetime
      Visit.all.each do |v|
        v.update(created_at: Time.now, updated_at: Time.now)
      end
      change_column :visits, :created_at, :datetime, null: false
      change_column :visits, :updated_at, :datetime, null: false
  end
end
