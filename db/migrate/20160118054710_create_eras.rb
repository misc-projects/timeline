class CreateEras < ActiveRecord::Migration
  def change
    create_table :eras do |t|
      t.string :abbrev
      t.string :name
      t.integer :direction
      t.integer :anchor # input as start year, convert to day
      t.belongs_to :calendar, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :eras, :abbrev
  end
end
