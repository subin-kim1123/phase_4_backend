class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :title
      t.string :description
      t.belongs_to :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
