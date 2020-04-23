class ApplicationController < ActionController::API
  include Render
  include ExceptionHandler
  include Crud
  before_action :verify_access_token, except: :access_token

  def verify_access_token
    current_user.present? ? true : false
  end

  protected

  def current_user
    User.find(decoded_token['data'])
  end

  private

  def decoded_token
    Jwt::Token.new.decode token: request.headers['Authorization']
  end
end
