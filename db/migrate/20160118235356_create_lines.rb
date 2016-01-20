class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
    	t.belongs_to :calendar, index: true, foreign_key: true
    	t.belongs_to :user, index: true, foreign_key: true
    	t.string :name
      t.timestamps null: false
    end
  end
end
