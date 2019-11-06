require 'support/acceptance_helper'

resource "Registration" do
  header "Accept", "application/json"
  header "Content-Type", "application/json"

  post "/signup" do
    parameter :email, "email", :required => true
    parameter :password, "password", :required => true
    parameter :role, "role", :required => true

    context 'when it has valid params' do
      let(:email) { 'tester@gmail.com' }
      let(:password) { '123123' }
      let(:role) { 'walker' }
      let(:raw_post) { params.to_json }

      example_request "200" do
        expect(status).to eq 200

        resp = JSON.parse(response_body)
        expect(resp).to include(
          'id' => 5,
          'email' => 'tester@gmail.com',
          'role_id' => 2,
        )
      end
    end

    context 'when it has already create user' do
      let(:email) { 'joao@gmail.com' }
      let(:password) { '123123' }
      let(:role) { 'walker' }
      let(:raw_post) { params.to_json }

      example_request "400" do
        expect(status).to eq 400

        resp = JSON.parse(response_body)
        expect(resp['error']).to eq({"email"=>["has already been taken"]})
      end
    end

  end
end