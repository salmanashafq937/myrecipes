class ChangeNameInRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
  	rename_column :recipe_ingredients, :chef_id, :ingredient_id
  end
end
