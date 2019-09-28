# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:existing_user) { users(:example).as_json.symbolize_keys }
  let(:user_payload) do
    {
      email: 'nicolas.vargas@gmail.com',
      name: 'nicolas',
      last_name: 'vargas',
      password: '1234567890'
    }
  end

  it 'validation controlled errors' do
    expect(subject.valid?).to be_falsey
    expect(subject.errors.details[:email].first[:error]).to eq(:blank)
    expect(subject.errors.details[:password].first[:error]).to eq(:blank)
    expect(subject.errors.details[:name].first[:error]).to eq(:blank)
  end

  it 'validating unique email' do
    user = described_class.new(existing_user)
    expect(user.valid?).to be_falsey
    expect(user.errors.details[:email].first[:error]).to eq(:taken)
    expect(user.errors[:email].first).to eq('has already been taken')
  end

  it 'create a user' do
    new_user = described_class.new(user_payload)
    expect(new_user.valid?).to be_truthy
    new_user.save!
    expect(new_user.persisted?).to be_truthy
  end
end
