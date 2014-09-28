class FavoritesController < ApplicationController
before_action :authenticate_user!

def create
	
	@user.favorites.create!(recipe: @recipe)
	redirect_to @recipe
end

def destroy
	
end

end
