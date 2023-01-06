class ApplicationController < ActionController::API
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  include ActionController::HttpAuthentication::Token::ControllerMethods
end
