class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :crypted_password, null: false
      t.integer :weight
      t.string :salt

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
