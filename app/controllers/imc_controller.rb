class ImcController < ApplicationController  
  include ImcHelper
  before_action :authenticate

  def compute

    @response =  calculate(imc_params)

    render json: @response, status: :ok

  end

  private

  def imc_params
    params.require(:imc).permit(:altura, :peso)
  end

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      JWT.decode token, SECRET_KEY, true, { algorithm: 'HS256' }
    end
  end

end
