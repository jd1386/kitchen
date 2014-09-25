class CommentsController < ApplicationController
	before_action :set_recipe

def create
	@comment = current_user.comments.build(comment_params)
	@comment.recipe = @recipe

	if @comment.save
		redirect_to recipe_path(@recipe)
	else
		render :new
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
