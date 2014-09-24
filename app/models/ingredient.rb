class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :food_item

  #validates_presence_of :recipe
  #validates_presence_of :food_item

  accepts_nested_attributes_for :food_item,
  	allow_destroy: true,
  	reject_if: proc { |attributes| attributes['name'].blank? }
end
