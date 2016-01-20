class CreateEventTags < ActiveRecord::Migration
  def change
    create_table :event_tags do |t|
      t.belongs_to :tag, index: true, foreign_key: true
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
