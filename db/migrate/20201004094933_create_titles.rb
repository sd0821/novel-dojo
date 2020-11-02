class CreateTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :titles do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.index :name, unique: true
      t.timestamps
    end
  end
end
