class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.integer :weight
      t.string :salt
      
      t.timestamps
    end
  end
end
