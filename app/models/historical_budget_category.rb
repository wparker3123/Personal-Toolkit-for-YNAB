class HistoricalBudgetCategory < ApplicationRecord
    has_many :historical_sub_categories, dependent: :destroy
    def self.update_categories(categories)
        ActiveRecord::Base.transaction do
            categories.each do |category|
                budget_category = HistoricalBudgetCategory.create(name: category[:name], amount: category[:total_budgeted], month: category[:month])
                category[:categories].each do |sub_category|
                    budget_category.historical_sub_categories.create(
                      group_name: sub_category[:group_name], 
                      name: sub_category[:name], 
                      budgeted: sub_category[:budgeted],
                      month: sub_category[:month]
                    )
                end
            end
        end
    rescue => e
        Rails.logger.error("Failed to update categories: #{e.message}")
        raise
    end
end
