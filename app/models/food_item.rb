class FoodItem < ActiveRecord::Base
	has_many :ingredients
end
