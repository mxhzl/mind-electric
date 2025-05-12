module Authenticated
  extend ActiveSupport::Concern

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    redirect_to root_path unless logged_in?
  end

  def current_user
    User.find_by(auth0_id: session[:userinfo]["sub"])
  end
end
