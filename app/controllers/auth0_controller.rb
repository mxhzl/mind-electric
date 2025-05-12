class Auth0Controller < ApplicationController
  def callback
    auth_info = request.env["omniauth.auth"]
    session[:userinfo] = auth_info["extra"]["raw_info"]
    User.find_or_create_by(auth0_id: session[:userinfo]["sub"])

    redirect_to logs_path, notice: "Welcome!"
  end

  def failure
    @error_msg = request.params["message"]
    redirect_to root_path, alert: "Try again later."
  end

  def login
    request_params = {
      redirect_uri: auth0_callback_url,
      client_id: AUTH0_CONFIG["auth0_client_id"],
      response_type: "token"
    }

    url = URI::HTTPS.build(host: AUTH0_CONFIG["auth0_domain"], path: "/authorize", query: to_query(request_params)).to_s

    redirect_to url, allow_other_host: true
  end

  def logout
    reset_session
    redirect_to logout_url, allow_other_host: true, notice: "Goodbye~"
  end

  private

  AUTH0_CONFIG = Rails.application.config_for(:auth0)

  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: AUTH0_CONFIG["auth0_client_id"]
    }

    URI::HTTPS.build(host: AUTH0_CONFIG["auth0_domain"], path: "/v2/logout", query: to_query(request_params)).to_s
  end

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join("&")
  end
end
