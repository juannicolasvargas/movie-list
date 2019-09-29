require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:payload) do
    {
      title: 'Avengers',
      description: 'chapter two',
      recommended: true,
      age_rating: 'suitable_for_all_audiences',
      release_data: '2019-06-12'
    }
  end

  it 'creating a movie' do
    new_movie = described_class.new(payload)
    expect(new_movie.valid?).to be_truthy
    new_movie.save!
    expect(new_movie.persisted?).to be_truthy
  end

  it 'validation controlled errors' do
    expect(subject.valid?).to be_falsey
    expect(subject.errors.details[:title].first[:error]).to eq(:blank)
    expect(subject.errors.details[:age_rating].first[:error]).to eq(:blank)
  end
end
