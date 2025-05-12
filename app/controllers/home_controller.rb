class HomeController < ApplicationController
  def index
    redirect_to logs_path if user_signed_in?
  end
end
