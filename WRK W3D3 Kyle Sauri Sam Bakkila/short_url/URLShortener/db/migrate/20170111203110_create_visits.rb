class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.integer :user_id, null: false
      t.integer :short_url_id, null: false
    end
    add_index(:visits, [:user_id, :short_url_id])
  end
end
