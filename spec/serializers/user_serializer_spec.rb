
require 'rails_helper'

RSpec.describe UserSerializer, type: :serializer do
  let(:model) { users(:example) }

  subject { described_class.new(model).as_json }

  it 'builds the attributes' do
    expect(subject[:email]).to eq('user@example.com')
    expect(subject[:name]).to eq('Nicolas')
    expect(subject[:last_name]).to eq('Vargas')
    expect(subject[:sign_in_count]).to eq(0)
  end
end
