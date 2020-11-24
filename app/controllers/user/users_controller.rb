class User::UsersController < UserController

  def show
    @user = User.find(params[:id])
  end

end
