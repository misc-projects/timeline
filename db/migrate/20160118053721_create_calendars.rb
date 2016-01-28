class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :abbrev
      t.string :name
      t.boolean :leap
      t.integer :leap_year_num
      t.integer :months_in_year
      t.integer :hours_in_day
      t.integer :week_length
      t.text :days_in_week, array: true, default: [] # length must be equal to week_length
      t.decimal :year_length

      t.integer :global_anchor
      t.integer :global_scale

      t.timestamps null: false
    end
    add_index :calendars, :abbrev
    add_index :calendars, :name
    add_index :calendars, [:name, :user_id]
    add_index :calendars, [:abbrev, :user_id]
  end
end
