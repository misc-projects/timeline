class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :line, index: true, foreign_key: true
      t.string :name
      t.integer :start_era
      t.integer :start_year
      t.integer :end_year
      t.integer :start_month
      t.integer :end_month
      t.integer :start_date
      t.integer :end_date
      t.integer :day
      t.decimal :hour, precision: 5, scale: 2
      t.text :summary
      t.text :detail
      t.integer :level
      t.string :type
      t.boolean :complete
      t.timestamps null: false
    end
  end
end
