class BudgetCategory < ApplicationRecord
    def self.update_categories(categories)
        ActiveRecord::Base.transaction do
        BudgetCategory.delete_all
        categories.each do |category|
            BudgetCategory.create(name: category[:name], amount: category[:total_budgeted], sub_categories: category[:categories])
        end
        end
    rescue => e
        Rails.logger.error("Failed to update categories: #{e.message}")
        raise
    end
  end
  