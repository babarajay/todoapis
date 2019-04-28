class CreateTodoListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_list_items do |t|
      t.integer :todo_list_id
      t.string  :title
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
