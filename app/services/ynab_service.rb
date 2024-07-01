class YnabService
    include HTTParty
    base_uri ENV['BASE_URL']
    debug_output $stdout # Optional: prints HTTP requests and responses to the console

    ACCESS_TOKEN = ENV['ACCESS_TOKEN']
    BUDGET_ID = ENV['BUDGET_ID']
    def self.fetch_category_groups
      Rails.cache.fetch("ynab_categories", expires_in: 4.hours) do
        options = {
          headers: { "Authorization" => "Bearer #{ACCESS_TOKEN}" }
        }
        response = get("/budgets/#{BUDGET_ID}/categories", options)
        if response.success?
          process_response(response)
        else
          raise "HTTP Error: #{response.code} #{response.message}"
        end
      end
    end
    private

    def self.process_response(response)
       # Process to get summaries of each group
      categories_data = response.parsed_response['data']['category_groups']

      group_summaries = categories_data.select do |category_group|
        !['Internal Master Category', 'Hidden Categories'].include?(category_group['name'])
      end.map do |category_group|
          grp_sum = category_group['categories'].sum { |category| category['budgeted'] / 1000.0 }
          puts "#{category_group['name']} #{category_group['categories'].length}"
          puts "Total Budgeted: $#{grp_sum}"

          internal_categories = category_group['categories'].map do |category|
            {
              group_name: category["category_group_name"],
              drilldown: [category["name"], category["budgeted"]]
            }
          end;
          { 
            name: category_group["name"],
            total_budgeted: grp_sum,
            categories: internal_categories
          }
        end.flatten
    # Return both summaries and details
    group_summaries
  end;
end;
  