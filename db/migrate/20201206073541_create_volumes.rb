class CreateVolumes < ActiveRecord::Migration[6.0]
  def change
    create_table :volumes do |t|
      t.references :user,      null: false, foreign_key: true
      t.references :title,     null: false, foreign_key: true
      t.string :name,          null: false
      t.text :content,         null: false

      t.timestamps
    end
  end
end
