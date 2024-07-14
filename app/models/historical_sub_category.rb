class HistoricalSubCategory < ApplicationRecord
    belongs_to :historical_budget_category

    validates :name, presence: true
    validates :budgeted, numericality: true
    validates :group_name, presence: true
    validates :budgeted, numericality: true
end
