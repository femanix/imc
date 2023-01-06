require 'rails_helper'
describe AuthsController, type: :controller do
  it 'post para rota auth com username preenchido' do
    
    post :create, params: {'auth':{'username': 'Usuário Test'}}

    expect(response).to have_http_status(:ok)
  end
end