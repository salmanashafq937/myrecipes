class RecipesController <ApplicationController
	#Index Action
	def index
		@recipes = Recipe.all
		
	end
	#show Action
	def show
		@recipe=Recipe.find(params[:id])
		
	end

	#new Action
	def new
		@recipe=Recipe.new
		
	end

	#Create Action
	def create
		@recipe=Recipe.new(recipe_params)
		@recipe.chef=Chef.first
		if @recipe.save
		 flash[:success]= "Recipe was created successfully"
		 redirect_to recipe_path(@recipe)		
		else
			render 'new'
		end

		
	end	


private

	def recipe_params
		params.require(:recipe).permit(:name, :description)
	end
end
