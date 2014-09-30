require 'csv'

desc "Import CSV data into equivalent tables"
task :import_csv => [:environment] do

	file = "data/food_item_1.csv"
	
	CSV.foreach(file, headers: true, encoding: 'UTF-8') do |row|
  	FoodItem.create(row.to_hash)
	end
end
