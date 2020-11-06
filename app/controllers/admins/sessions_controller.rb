class Admins::SessionsController < Devise::SessionsController

  def after_sign_out_path_for(admin)
    new_admin_session_path
  end

end
