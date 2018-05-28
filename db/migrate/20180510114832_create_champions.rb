class CreateChampions < ActiveRecord::Migration[5.0]
  def change
    create_table :champions do |t|
      t.string  :name, null: false, index: true, unique: true
      t.text    :image, null: false, unique: true
      t.timestamps
    end
  end
end
