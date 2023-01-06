class AuthsController < ApplicationController
  #SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def create    
    token = JWT.encode set_payload, SECRET_KEY, 'HS256'
    render json: {token: token}
  end

  private

  def set_payload
    params.require(:auth).permit(:username)
    {
       username: params[:username],
       exp: 10.minutes.from_now.to_i
    }
  end
end
