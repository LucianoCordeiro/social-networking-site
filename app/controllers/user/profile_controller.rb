class User::ProfileController < UserController

  def show
    @post = Post.new
  end

end
