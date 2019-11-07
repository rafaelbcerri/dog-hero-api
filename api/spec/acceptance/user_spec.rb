require 'support/acceptance_helper'

resource 'User' do

  authentication :basic, :api_key
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  let(:user) { User.find_by_id(3) }
  let(:api_key) { 'Bearer ' + Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first }

  get '/users/:id/dog_walkings' do
    let(:id) { user.id }

    context '200' do
      example_request 'GET - All dog walkings from user' do
        expect(status).to eq 200

        resp = JSON.parse(response_body)
        expect(resp.length).to eq 8
        expect(resp.first).to include(
          'duration' => 60,
          'latitude' => '-23.534296',
          'longitude' => '-46.724113',
          'begin_date' => nil,
          'end_date' => nil,
          'scheduled_date' => '2019-11-16T17:00:00.000Z',
          'price' => 55.0,
          'user_id' => nil,
          'dog_walking_status_id' => 1
        )
      end
    end
  end
end