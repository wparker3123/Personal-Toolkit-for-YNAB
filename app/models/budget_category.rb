class BudgetCategory < ApplicationRecord
    has_many :sub_categories, dependent: :destroy
    def self.update_categories(categories)
        ActiveRecord::Base.transaction do
            BudgetCategory.delete_all
            categories.each do |category|
                budget_category = BudgetCategory.create(name: category[:name], amount: category[:total_budgeted])
                category[:categories].each do |sub_category|
                    budget_category.sub_categories.create(
                      group_name: sub_category[:group_name], 
                      name: sub_category[:name], 
                      budgeted: sub_category[:budgeted]
                    )
                end
            end
        end
    rescue => e
        Rails.logger.error("Failed to update categories: #{e.message}")
        raise
    end

    def self.import_previous_months()
        puts "test"
    end
end
  