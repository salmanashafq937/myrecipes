class RecipesController <ApplicationController
	before_action :set_recipe, only:[:show, :edit, :update]
	#Index Action
	def index
		@recipes = Recipe.all
		
	end
	#show Action
	def show
		
	end

	#new Action
	def new
		@recipe=Recipe.new
	end

	#Create Action
	def create
		@recipe.chef=Chef.first
		if @recipe.save
			flash[:success]= "Recipe was created successfully"
		 	redirect_to recipe_path(@recipe)		
		else
			render 'new'
		end
	end	


	#edit Action
	def edit

	end

	#update Action
	def update
		if @recipe.update(recipe_params) 
			flash[:success]= "Recipe was updated successfully"
		 	redirect_to recipe_path(@recipe)
		else
			render 'edit'
		end
	end

	#destroy Action
	def destroy
		Recipe.find(params[:id]).destroy
		flash[:success]= "Recipe was deleted successfully"
		redirect_to recipes_path

		
	end

private

	def set_recipe
		@recipe=Recipe.find(params[:id])
		
	end

	def recipe_params
		params.require(:recipe).permit(:name, :description)
	end
end
