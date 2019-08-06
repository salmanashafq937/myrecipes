class RecipesController <ApplicationController
	#Index Action
	def index
		@recipes = Recipe.all
		
	end
	#show Action
	def show
		@recipe=Recipe.find(params[:id])
		
	end


end
