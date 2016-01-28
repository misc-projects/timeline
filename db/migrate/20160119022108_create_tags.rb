class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.belongs_to :line, index: true, foreign_key: true
    	t.string :name
      t.timestamps null: false
    end
    add_index :tags, :name, unique: true
  end
end
