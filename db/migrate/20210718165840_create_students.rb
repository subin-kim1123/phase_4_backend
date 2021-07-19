class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.belongs_to :teacher, null: false, foreign_key: true
      t.string :name
      t.integer :grade
      t.string :hair_color
      t.integer :sibling_amount

      t.timestamps
    end
  end
end
