class CreateRandomSpeeches < ActiveRecord::Migration[7.0]
  def change
    create_table :random_speeches do |t|
      t.references :character, null: false, foreign_key: true
      t.string :alcohol_speeches
      t.string :random_speeches

      t.timestamps
    end
  end
end
