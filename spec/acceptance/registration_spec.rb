require 'support/acceptance_helper'

resource 'Registration' do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  post '/signup' do
    parameter :name, 'name', :required => true
    parameter :email, 'email', :required => true
    parameter :password, 'password', :required => true
    parameter :role, 'role', :required => true

    context '201' do
      let(:name) { 'Tester' }
      let(:email) { 'tester@gmail.com' }
      let(:password) { '123123' }
      let(:role) { 'walker' }
      let(:raw_post) { params.to_json }

      example_request 'POST - Create walker account' do
        expect(status).to eq 201

        resp = JSON.parse(response_body)
        expect(resp).to include(
          'id' => 5,
          'name' => 'Tester',
          'email' => 'tester@gmail.com',
          'role_id' => 2,
        )
      end
    end

    context '201' do
      let(:name) { 'Tester' }
      let(:email) { 'tester@gmail.com' }
      let(:password) { '123123' }
      let(:role) { 'pet_owner' }
      let(:dogs) { [{
        name: 'Cachorro',
        age: 10
      }]}
      let(:raw_post) { params.to_json }

      example_request 'POST - Create pet_owner account' do
        expect(status).to eq 201

        resp = JSON.parse(response_body)
        expect(resp).to include(
          'id' => 6,
          'name' => 'Tester',
          'email' => 'tester@gmail.com',
          'role_id' => 1,
        )
      end
    end

    context '400' do
      let(:name) { 'João' }
      let(:email) { 'joao@gmail.com' }
      let(:password) { '123123' }
      let(:role) { 'walker' }
      let(:raw_post) { params.to_json }

      example_request 'POST - Account already exists' do
        expect(status).to eq 400

        resp = JSON.parse(response_body)
        expect(resp['error']).to eq({ 'email'=>['has already been taken'] })
      end
    end

  end
end