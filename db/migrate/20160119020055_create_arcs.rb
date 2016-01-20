class CreateArcs < ActiveRecord::Migration
  def change
    create_table :arcs do |t|
      t.belongs_to :line, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end
