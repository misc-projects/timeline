class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.integer :number
      t.string :abbrev
      t.string :name
      t.integer :length_in_days
      t.boolean :leaper
      t.belongs_to :calendar, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
