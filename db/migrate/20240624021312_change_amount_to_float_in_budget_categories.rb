class ChangeAmountToFloatInBudgetCategories < ActiveRecord::Migration[7.1]
  def change
    change_column :budget_categories, :amount, :decimal, precision: 10, scale: 2
  end
end
