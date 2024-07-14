class AddSubcategoryKeyColumn < ActiveRecord::Migration[7.1]
  def change
    # add_column :sub_categories, :budget_category_id, :integer
    add_foreign_key :sub_categories, :budget_categories unless foreign_key_exists?(:sub_categories, :budget_categories)
  end
end
