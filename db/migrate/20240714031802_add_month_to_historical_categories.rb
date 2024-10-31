class AddMonthToHistoricalCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :historical_budget_categories, :month, :date
    add_column :historical_sub_categories, :month, :date
  end
end
