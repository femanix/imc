#Controller responsável por gerar o token de acesso a API
class AuthsController < ApplicationController  
  #Cria o token utilizando a lib JWT e retorna o token de acesso
  def create        
    token = JWT.encode payload, SECRET_KEY, 'HS256'
    render json: {token: token}
  end

  private
  #Permite apenas os parâmetros permitidos e seta o tempo de expiração
  def payload    
    params.require(:auth).permit(:username)
    {
       username: params[:username],
       exp: 10.minutes.from_now.to_i
    }
  end
end
