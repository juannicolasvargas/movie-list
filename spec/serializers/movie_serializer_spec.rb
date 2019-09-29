
require 'rails_helper'

RSpec.describe MovieSerializer, type: :serializer do
  let(:model) { movies(:first_movie) }

  subject { described_class.new(model).as_json }

  it 'builds the attributes' do
    expect(subject[:title]).to eq('Star Wars')
    expect(subject[:description]).to eq('chapter one')
    expect(subject[:recommended]).to eq(true)
    expect(subject[:age_rating]).to eq('suitable_for_all_audiences')
    expect(subject[:release_data].to_s).to eq('1999-12-22')
  end
end
