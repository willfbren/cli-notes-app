class ChangeNoteTitleColumnNameToContent < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :title, :content
  end
end
