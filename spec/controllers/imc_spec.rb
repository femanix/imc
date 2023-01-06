require 'rails_helper'
require 'tokens_helper'

  describe ImcController, type: :controller do
    it 'post para rota imc sem token' do
      post :compute
      expect(response).to have_http_status(:unauthorized)
    end
  

    it 'post para rota imc com token expirado' do
      request.headers["Authorization"] = EXPIRED_TOKEN
      post :compute
      expect(response).to have_http_status(:unauthorized)
    end
  end
  