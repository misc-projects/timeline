class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :line, index: true, foreign_key: true
      t.integer :start # all start and end are stored as integers in the default global calendar system (converted to local in controller)
      t.integer :end
      t.text :summary
      t.text :detail
      t.integer :level
      t.string :type
      t.boolean :complete
      t.timestamps null: false
    end
  end
end
