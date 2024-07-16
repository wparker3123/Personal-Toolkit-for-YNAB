class ReportsController < ApplicationController
  def category_overview
    # @categories = BudgetCategory.all
    categories = YnabService.fetch_category_groups()
    BudgetCategory.update_categories(categories)
    @categories = BudgetCategory.includes(:sub_categories).all
    @sub_categories = @categories.map(&:sub_categories).flatten.group_by(&:group_name)

    current_day = Date.today
    month_list = ["#{current_day.strftime('%B')} (Current)"]
    6.times do |i|
      previous_month = current_day << (i + 1)
      month_list.push(previous_month.strftime('%B'))
    end

    @dates = month_list
  end

  def fetch_prev_category_assignments(month)
    categories = HistoricalBudgetCategory.includes(:historical_sub_categories).all
    sub_categories = categories.map(&:historical_sub_categories).flatten.group_by(&:group_name)

    {categories: categories, sub_categories: sub_categories}
  end
  helper_method :fetch_prev_category_assignments
end
