class PagesController < ApplicationController
  def home
    @data = BudgetCategory.pluck(:name, :amount).to_h
  end
end
