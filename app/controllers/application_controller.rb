class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods
  protect_from_forgery with: :null_session
  before_action :authenticate, if: -> { request.format.json? }

  def authenticate!
    @current_user || render_unauthorized
  end

  protected

  def authenticate
    authenticate_token
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      @current_user = User.find_by(api_key: token)
    end
  end

  def render_unauthorized
    render json: { error: 'You nedd to sign in or sign up before continuing' }, status: :unauthorized
  end
end

