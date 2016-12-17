class CommentsController < ApplicationController
  
	before_action :require_user, except: [:show, :like]
	before_action :find_commentable

	def new
		@comment = Comment.new
	end

	def create
		@comment = @commentable.comments.new comment_params

		# Isso é segguro pois, jamais aparecerá as opções de comentar se o 
		# usuário não estiver logado..... 
		@comment.chef_id = current_user.id
		
		# ajax
		@comment.save!

		respond_to do |format|
			format.html { redirect_to :back } # se o cliente quiser html, esse bloco é executado
			format.js # render comments/create.js.erb (mesmo nome da ação)
		end

	# if @comment.save 
  #     redirect_to :back, notice: 'Your comment was successfully posted!'
  #   else
  #     redirect_to :back, notice: "Your comment wasn't posted!"
  #   end
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

    def find_author_comment

    end

    def require_user_like
      if !logged_in?
        flash[:danger] = "You Must be logged in to perform that action!"
        redirect_to :back
      end
    end

end
