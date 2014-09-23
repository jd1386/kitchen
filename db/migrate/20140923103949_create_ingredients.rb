class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :volume
      t.references :recipe, index: true
      t.references :food_item, index: true

      t.timestamps
    end
  end
end
