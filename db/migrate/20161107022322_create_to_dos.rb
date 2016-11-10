class CreateToDos < ActiveRecord::Migration[5.0]
  def change
    create_table :to_dos do |t|
      t.string :title
      t.text :description
      t.boolean :completed, default: false
      t.datetime :due

      t.timestamps
    end
  end
end
