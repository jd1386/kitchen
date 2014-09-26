class CommentsController < ApplicationController
	before_action :set_recipe

def create
	@comment = current_user.comments.build(comment_params)
	@comment.recipe = @recipe

	respond_to do |format|
		if @comment.save
			format.html { redirect_to recipe_path(@recipe) }
			format.js
		end
	end
end


def destroy
	@comment = Comment.find(params[:id])
	@comment.destroy
	redirect_to recipe_path(@recipe)
end



private
	
	def set_recipe
		@recipe = Recipe.find(params[:recipe_id])
	end
	
	def comment_params
		params.require(:comment).permit(:content)
	end

end
