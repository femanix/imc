class ImcController < ApplicationController
  # Recebe os dados de cálculo do IMC
  include ImcHelper
  before_action :authenticate

  def compute
    @response =  calculate(imc_params) # Helper recebe os parâmetros do IMC e retorna a classificação
    render json: @response, status: :ok
  end

  private
 #Permite apenas os parâmetros confiáveis
  def imc_params
    params.require(:imc).permit(:height, :weight)
  end

  #Realiza a autenticação e caso negada retorna erro 
  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      JWT.decode token, SECRET_KEY, true, { algorithm: 'HS256' }
    end
  rescue JWT::ExpiredSignature
    render json: { error: 'Token expirado!' }, status: :unauthorized
  rescue JWT::DecodeError
    render json: { error: 'Token Inválido!' }, status: :unauthorized
  end
end
