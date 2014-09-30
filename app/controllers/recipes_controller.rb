class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.includes(:user, :ingredients, :food_items, :comments, :favorites, :fans).find(params[:id])
    @comment = @recipe.comments.new

   # Because @recipe already includes its associated entities, no more need the followings. 
   # @comments = @recipe.comments
   # @fans = @recipe.fans

    if current_user
      @current_favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    end

  end

  def new
    @recipe = Recipe.new
    3.times { @recipe.ingredients.build.build_food_item }
    # @recipe.ingredients.build_food_item = FoodItem.find_or_create_by()

  end

  def edit
    @recipe.ingredients.build.build_food_item
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' 
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :image, :method, :source, :tip, :serving, ingredients_attributes: [:id, :volume, :_destroy, food_item_attributes: [:id, :name, :_destroy]])
    end

end

