class AddSubcategoryToYnabModel < ActiveRecord::Migration[7.1]
  def change
    add_column :budget_categories, :sub_categories, :json
  end
end
