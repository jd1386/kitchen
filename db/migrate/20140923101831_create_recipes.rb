class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :method
      t.string :source
      t.text :tip
      t.string :serving

      t.timestamps
    end
  end
end
