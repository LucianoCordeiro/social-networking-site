class User::PostsController < UserController

  def create
    f_params = form_params.merge(user: current_user)

    @post = Post.new(f_params)

    if @post.save
      redirect_to user_profile_path
    else
      render "user/profile/show"
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy

    redirect_to user_profile_path
  end

  private

  def form_params
    params.require(:post).permit(:body)
  end

end
