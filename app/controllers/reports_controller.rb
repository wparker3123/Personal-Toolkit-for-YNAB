class ReportsController < ApplicationController
  def categoryoverview
    # @categories = BudgetCategory.all
    categories = YnabService.fetch_category_groups()
    BudgetCategory.update_categories(categories)
    @categories = BudgetCategory.select(:name, :amount)
    @sub_categories = BudgetCategory.select(:sub_categories)

    @data = [
      { name: 'Vegetables', y: 40 },
      { name: 'Fruits', y: 30 },
      { name: 'Meats', y: 30 }
    ]

    current_day = Date.today
    month_list = ["#{current_day.strftime('%B')} (Current)"]
    6.times do |i|
      previous_month = current_day << (i + 1)
      month_list.push(previous_month.strftime('%B'))
    end

    @dates = month_list
  end
end
