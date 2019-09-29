require 'rails_helper'

RSpec.describe "Movies", type: :request do
  let(:user) { users(:example) }
  let(:movie_payload) do
    {
      movie: {
        title: 'Avengers',
        description: 'chapter two',
        recommended: true,
        age_rating: 'suitable_for_all_audiences',
        release_data: '2019-06-12'
      }
    }
  end

  before do
    sign_in(user)
  end

  it 'returns error with any action without a user connected' do
    sign_out(user)
    get v1_movies_path
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(401)
    expect(parsed_response).to include :errors
    expect(parsed_response[:errors].first).to eq('You need to sign in or sign up before continuing.')
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get v1_movies_path
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(parsed_response).to be_an(Array)
      expect(parsed_response.first[:title]).to eq('Star Wars')
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get v1_movie_path(id: 1)
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(parsed_response[:id]).to eq(1)
      expect(parsed_response[:title]).to eq('Star Wars')
    end

    it 'returns movie not found' do
      get v1_movie_path(id: 89999)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it "creates a new Movie" do
        expect {
          post '/v1/movies', params: movie_payload
        }.to change(Movie, :count).by(1)
      end

      it 'renders a JSON response with the new movie' do
        post '/v1/movies', params: movie_payload
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new movie' do
        post '/v1/movies', params: { movie: { title: nil } }
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to have_http_status(422)
        expect(parsed_response[:recommended].first).to eq("can't be blank")
      end
    end
  end

  describe 'PUT #update' do
    it 'renders a JSON response with the movie updated' do
      movie = Movie.create!(movie_payload[:movie])
      put "/v1/movies/#{movie.id}", params: { movie: { title: 'Avengers_2' } }
      movie.reload
      expect(response).to have_http_status(:ok)
      expect(movie.title).to eq('Avengers_2')
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested movie" do
      movie = Movie.create!(movie_payload[:movie])
      expect {
        delete "/v1/movies/#{movie.id}"
      }.to change(Movie, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end
  end
end
