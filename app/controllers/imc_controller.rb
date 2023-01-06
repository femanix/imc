class ImcController < ApplicationController  
  include ImcHelper
  before_action :authenticate

  def compute

    @response =  calculate(imc_params)

    render json: @response, status: :ok

  end

  private

  def imc_params
    params.require(:imc).permit(:height, :weight)
  end

  def authenticate
    begin
      authenticate_or_request_with_http_token do |token, options|
        JWT.decode token, SECRET_KEY, true, { algorithm: 'HS256' }
      end
    rescue JWT::ExpiredSignature
      render json: {error: 'Token expirado!'}, status: :unauthorized
    rescue JWT::DecodeError
      render json: {error: 'Token Inválido!'}, status: :unauthorized
    end
  end
end
