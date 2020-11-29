class User::CommentsController < UserController

  def create
    f_params = form_params.merge(user: current_user)
    @comment = Comment.new(f_params)
    @post = @comment.post

    if @comment.save
      respond_to do |format|
        format.js { render "create" }
      end
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @post = @comment.post

    if @comment.destroy
      respond_to do |format|
        format.js { render "destroy" }
      end
    end
  end


  private

  def form_params
    params.require(:comment).permit(:body, :post_id)
  end

end
