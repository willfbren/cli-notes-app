class NotesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.datetime :due_date
      t.string :priority
      t.boolean :is_done
      t.integer :user_id
      t.integer :category_id
    end
  end
end
