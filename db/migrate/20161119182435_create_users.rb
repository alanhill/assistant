class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :admin, default: false
      t.datetime :last_login

      t.timestamps
    end
  end
end
