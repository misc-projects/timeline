class CreateEntityEvents < ActiveRecord::Migration
  def change
    create_table :entity_events do |t|
      t.belongs_to :entity, index: true, foreign_key: true
      t.belongs_to :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
