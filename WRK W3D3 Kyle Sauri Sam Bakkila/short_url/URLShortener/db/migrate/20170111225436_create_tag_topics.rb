class CreateTagTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_topics do |t|
      t.string :topic_name, null: false
    end
    add_index(:tag_topics, :topic_name, unique: true)
  end
end
