class ReportsController < ApplicationController
  def categoryoverview
    # @categories = BudgetCategory.all
    categories = YnabService.fetch_category_groups()
    BudgetCategory.update_categories(categories)
    @categories = BudgetCategory.includes(:sub_categories).all
    @sub_categories = @categories.map(&:sub_categories).flatten.group_by(&:group_name)

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
