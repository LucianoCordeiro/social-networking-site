class User::PostsController < UserController
  skip_before_action :verify_authenticity_token, only: :like_toggle

  def create
    f_params = form_params.merge(user: current_user)

    @post = Post.new(f_params)
    @comment = Comment.new

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

  def like_toggle
    post = Post.find(params[:id])
    like = Like.find_by(user: current_user, post: post)

    if like.present?
      like.destroy
      respond_to {|format| format.json { render json: {liked: false, likesCount: post.likes.count}}}
    else
      Like.create(user: current_user, post: post)
      respond_to {|format| format.json { render json: {liked: true, likesCount: post.likes.count}}}
    end
  end

  private

  def form_params
    params.require(:post).permit(:body)
  end

end
