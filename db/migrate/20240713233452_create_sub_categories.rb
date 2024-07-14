class CreateSubCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_categories do |t|
      t.string :group_name
      t.string :name
      t.float :budgeted
      t.integer :budget_category_id

      t.timestamps
    end

    remove_column :budget_categories, :sub_categories, :json
    add_foreign_key :sub_categories, :budget_categories
  end
end
