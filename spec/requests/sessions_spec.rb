# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let(:user) { users(:example) }

  before do
    sign_in(user)
  end

  it 'sign user' do
    get '/auth/validate_token'
    expect(response).to have_http_status(200)
    expect(controller.current_user).to eq(user)
    expect(controller.user_signed_in?).to be_truthy
  end

  it 'sign out' do
    sign_out(user)
    get '/auth/validate_token'
    expect(response).to have_http_status(401)
    expect(controller.current_user).to be_nil
    expect(controller.user_signed_in?).to be_falsey
  end

end
