class RenameImageColumnToKey < ActiveRecord::Migration[5.0]
  def change
    rename_column :champions, :image, :key
  end
end
