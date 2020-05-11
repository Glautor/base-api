module ExceptionHandler
  extend ActiveSupport::Concern
  
  included do
    rescue_from StandardError, with: :standard_error
    rescue_from Utils::Errors::User::Unauthorized, with: :handle_unauthorized
    rescue_from ActionController::BadRequest, with: :handle_bad_request
    rescue_from Utils::Errors::Serializer::ClassNotFound, with: :handle_internal_server_error
  end

  private

  def standard_error(e)
    puts e.message
    json_error(500, e.message) 
  end

  def handle_unauthorized
    json_error(400, :unauthorized)
  end

  def handle_bad_request
    json_error(400, :bad_request)
  end

  def handle_internal_server_error
    json_error(500, :internal_server_error)
  end
end
