require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST authentication' do
    let(:user) { FactoryBot.create(:user, username: 'Jack', password: 'password') }
    it 'Authenticates the client' do
      post '/api/v1/login', params: { username: user.username, password: user.password }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to_not eq({})
    end

    it 'Should return error when username is not present' do
      post '/api/v1/login', params: { password: 'password' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to include({
                                                     'error' => 'param is missing or the value is empty'
                                                   })
    end

    it 'Should return an error when password is wrong' do
      post '/api/v1/login', params: { username: user.username, password: 'incorrect' }
      expect(response).to have_http_status(:unauthorized)
    end
  end
end