class CommentsController < ApplicationController
  
	before_action :require_user, except: [:show, :like]
	before_action :find_commentable

	def new
		@comment = Comment.new
	end

	def create
		@comment = @commentable.comments.new comment_params
		if @comment.save 
      redirect_to :back, notice: 'Your comment was successfully posted!'
    else
      redirect_to :back, notice: "Your comment wasn't posted!"
    end
	end

  def show
  end

  def edit
  	 @comment = Comment.find(params[:id])
  end

   def destroy 

    @comment.destroy
    flash[:success] = "Your comment has been deleted Succesfully!"
    redirect_to chef_path(current_user) #mudar
  end



  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Recipe.find_by_id(params[:recipe_id]) if params[:recipe_id]
    end


    def require_user_like
      if !logged_in?
        flash[:danger] = "You Must be logged in to perform that action!"
        redirect_to :back
      end
    end

end
