require 'support/acceptance_helper'

resource 'Session' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  let(:user) { create(:user) }

  post '/login' do
    parameter :email, 'User email', :required => true
    parameter :password, 'User password', :required => true

    context '200' do
      let(:email) { 'joao@gmail.com' }
      let(:password) { '123123' }
      let(:raw_post) { params.to_json }

      example_request 'POST - User login' do

        expect(status).to eq 200

        resp = JSON.parse(response_body)
        expect(resp).to include(
          'id' => 1,
          'email' => 'joao@gmail.com',
          'name' => 'João',
          'image' => 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&h=400&w=400',
          'role_id' => 2,
        )

        token_from_request = response_headers['Authorization'].split(' ').last
        decoded_token = JWT.decode(token_from_request, ENV['DEVISE_SECRET_KEY'], true)
        expect(decoded_token.first['sub']).to eq '1'
      end
    end

    context '401' do
      let(:email) { 'joao@gmail.com' }
      let(:password) { '321321' }
      let(:raw_post) { params.to_json }

      example_request 'POST - User invalid password' do
        expect(status).to eq 401

        resp = JSON.parse(response_body)
        expect(resp['error']).to eq('Invalid Email or password.')

        expect(response_headers['Authorization']).to be_nil
      end
    end
  end
end