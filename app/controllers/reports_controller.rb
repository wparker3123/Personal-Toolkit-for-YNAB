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

    @drilldown_series = [
      { name: 'Vegetables', data: [['Potatoes', 10], ['Carrots', 15], ['Broccoli', 15]] },
      { name: 'Fruits', data: [['Apples', 10], ['Oranges', 10], ['Bananas', 10]] },
      { name: 'Meats', data: [['Chicken', 15], ['Beef', 10], ['Pork', 5]] }
    ]
  end
end
