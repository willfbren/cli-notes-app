class UpdateDueDateColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :notes, :due_date, :string
  end
end
