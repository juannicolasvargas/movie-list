require 'rails_helper'

RSpec.describe "Recommended movies", type: :request do
  let(:user) { users(:example) }

  before do
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get v1_recommended_movies_path
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(parsed_response).to be_an(Array)
      expect(parsed_response.first[:title]).to eq('Star Wars')
    end
  end

  it 'returns error with any action without a user connected' do
    sign_out(user)
    get v1_recommended_movies_path
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(401)
    expect(parsed_response).to include :errors
    expect(parsed_response[:errors].first).to eq('You need to sign in or sign up before continuing.')
  end
end
