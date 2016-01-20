class CreateArcEvents < ActiveRecord::Migration
  def change
    create_table :arc_events do |t|
      t.belongs_to :arc, index: true, foreign_key: true
      t.belongs_to :event, index: true, foreign_key: true
      t.integer :event_order
      t.timestamps null: false
    end
  end
end
