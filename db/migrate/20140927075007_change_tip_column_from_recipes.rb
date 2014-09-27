class ChangeTipColumnFromRecipes < ActiveRecord::Migration
  def change
  	rename_column :recipes, :tip, :description
  end
end
