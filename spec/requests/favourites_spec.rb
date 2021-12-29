
  
require 'rails_helper'

RSpec.describe 'Favourites', type: :request do
  let(:user) { FactoryBot.create(:user, password: 'password') }
  let(:house) do
    FactoryBot.create(
      :house,
      house_name: 'Aso Rock Abuja',
      house_description: 'Sit of Power Abuja',
      images: 'https://cf.bstatic.com/xdata/images/h'
    )
  end
  before do
    allow(AuthenticationTokenService).to receive(:decode).and_return(user.id)
  end

  describe 'POST /index' do
    it 'It adds to favourite' do
      expect do
        post '/api/v1/favourites/',
             params: {
               favourite: {
                 house_id: house.id
               }
             }
      end.to change { Favourite.count }.from(0).to(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /favourites' do
    it 'returns all favourites' do
      post '/api/v1/favourites/',
           params: {
             favourite: {
               house_id: house.id
             }
           }
      get '/api/v1/favourites/'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end
  describe 'DELETE /favourites' do
    it 'Should remove a house from favourites' do
      post '/api/v1/favourites',
           params: {
             favourite: {
               house_id: house.id
             }
           }
      expect do
        delete "/api/v1/favourites/#{house.id}"
      end.to change { Favourite.count }.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end