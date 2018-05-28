class CreateSkins < ActiveRecord::Migration[5.0]
  def change
    create_table :skins do |t|
      t.integer :skin_num, null: false, index: true
      t.integer :skin_id, null: false
      t.string  :name, null: false, unique: true
      t.string  :type
      t.integer :price
      t.references :champion, foreign_key: true
      t.timestamps
    end
  end
end
