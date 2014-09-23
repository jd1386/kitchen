class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :food_item

  validates_presence_of :recipe
  validates_presence_of :food_item
end
