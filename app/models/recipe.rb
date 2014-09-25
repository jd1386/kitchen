class Recipe < ActiveRecord::Base
	belongs_to :user
	has_many :ingredients, dependent: :destroy
	has_many :food_items, through: :ingredients
	has_many :comments, dependent: :destroy

	

	accepts_nested_attributes_for :ingredients, 
		allow_destroy: true,
  		reject_if: proc { |attributes| attributes['volume'].blank? }

end
