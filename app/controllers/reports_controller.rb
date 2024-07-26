class ReportsController < ApplicationController
  def category_overview
    # @categories = BudgetCategory.all
    categories = YnabService.fetch_category_groups()
    BudgetCategory.update_categories(categories)
    @categories = BudgetCategory.includes(:sub_categories).all.sort_by { |a| -a.amount}
    @sub_categories = @categories.map(&:sub_categories).flatten.group_by(&:group_name)

    current_day = Date.today
    month_list = ["#{current_day.strftime('%B')} (Current)"]
    6.times do |i|
      previous_month = current_day << (i + 1)
      month_list.push(previous_month.strftime('%B'))
    end

    @dates = month_list
  end

  def fetch_prev_category_assignments
    month = params[:month]
    render json: { error: "Month not provided" }, status: :bad_request and return if month.nil?
    month_num = Date::MONTHNAMES.index(month)
    year = 2024 unless params[:year]
    date = Date.new(year, month_num, 1)

    if month_num
      if HistoricalBudgetCategory.where("strftime('%m', month) = ?", sprintf('%02d', month_num)).count.zero?
        data = YnabService.fetch_previous_budget_data(date.iso8601)
        render json: { error: "Month not available in current budget.", detail: "Resource not found", code: "404.2" }, status: :not_found and return if data.nil?
        HistoricalBudgetCategory.update_categories(data)
      end

      categories = HistoricalBudgetCategory.includes(:historical_sub_categories).where("strftime('%m', month) = ?", sprintf('%02d', month_num))
      @new_categories = categories
      prev_categories_data = categories.map do |category|
        {
          name: category.name,
          y: category.amount.to_f,
          drilldown: category.name
        }
      end
      prev_sub_categories_data = categories.map do |category|
        {
          id: category.name,
          name: category.name,
          data: category.historical_sub_categories.map do |sub_category|
            [ sub_category.name, sub_category.budgeted.to_f ]
          end
        }
      end
      render json: { categories: prev_categories_data, sub_categories: prev_sub_categories_data }
    end
  end
  helper_method :fetch_prev_category_assignments
end
