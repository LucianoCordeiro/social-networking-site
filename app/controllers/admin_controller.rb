class AdminController < ApplicationController
  before_action :authenticate_admin

  def authenticate_admin
    redirect_to new_admin_session_path unless current_admin?
  end


  def current_admin?
    if current_admin.present?
      true
    else
      false
    end
  end
end
