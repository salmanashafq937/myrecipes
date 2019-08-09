class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
    	t.integer :recipe_id
    	t.integer :chef_id
    end
  end
end
