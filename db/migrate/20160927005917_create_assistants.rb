class CreateAssistants < ActiveRecord::Migration[5.0]
  def change
    create_table :assistants do |t|
      t.json 'payload'
      t.timestamps
    end
  end
end
