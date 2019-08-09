class RecipesController <ApplicationController
	before_action :set_recipe, only:[:show, :edit, :update , :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]	

	#Index Action
	def index
		@recipes = Recipe.paginate(page: params[:page], per_page: 5)
		
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
		@recipe=Recipe.new(recipe_params)
		@recipe.chef = current_chef
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

	#set_recipe method
	def set_recipe
		@recipe=Recipe.find(params[:id])
		
	end
	#recipe_params method
	def recipe_params
		params.require(:recipe).permit(:name, :description)
	end
	#require_same_user method
	def require_same_user
		if current_chef != @recipe.chef and !current_chef.admin? 
			flash[:danger]= "You can only edit or delete your own recipes"
			redirect_to recipes_path
		end	
	end
end
