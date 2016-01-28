class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
    	t.belongs_to :line, index: true, foreign_key: true
    	t.string :name
    	t.string :type
      t.timestamps null: false
    end
    add_index :entities, :name
    add_index :entities, :type
  end
end
