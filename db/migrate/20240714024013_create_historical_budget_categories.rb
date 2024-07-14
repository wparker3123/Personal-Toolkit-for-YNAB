class CreateHistoricalBudgetCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :historical_budget_categories do |t|
      t.string :name
      t.decimal :amount, precision: 10, scale: 2
      t.integer :budget_category_id

      t.timestamps
    end
    create_table :historical_sub_categories do |t|
      t.string :group_name
      t.string :name
      t.decimal :budgeted, precision: 10, scale: 2
      t.integer :historical_budget_category_id  # Ensuring it links back to HistoricalBudgetCategories
      t.timestamps
    end
    add_index :historical_sub_categories, :historical_budget_category_id
    add_index :historical_budget_categories, :budget_category_id
    add_foreign_key :historical_sub_categories, :historical_budget_categories, column: :historical_budget_category_id
  end
end
