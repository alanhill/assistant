class CreatePhoneLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :phone_logs do |t|
      t.string :incoming_type
      t.string :from_city
      t.string :from_state
      t.string :from_country
      t.string :sid
      t.text :body
      t.string :status
      t.string :phone_number

      t.timestamps
    end
  end
end
