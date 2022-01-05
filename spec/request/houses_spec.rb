require 'rails_helper'

describe 'API test', type: :request do
  describe 'GET /Houses' do
    before do
      FactoryBot.create(:house, house_name: 'Aso Rock Abuja',
                                house_description: 'Sit of Power Nigeria',
                                images: 'https://media.hotels.ng/')
      FactoryBot.create(:house, house_name: 'White House',
                                house_description: 'Sit of Power in America',
                                images: 'https://media.hotels.ng/')
    end

    it 'Should Return all Houses of Sit of powers' do
      get '/api/v1/houses'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'Should not return undefined ' do
      get '/api/v1/houses'
      expect(JSON.parse(response.body).size).to_not eq(nil)
    end
  end
end
