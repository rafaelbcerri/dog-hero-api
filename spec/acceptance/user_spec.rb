require 'support/acceptance_helper'

resource 'User' do

  authentication :basic, :api_key
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  get '/users/:id/dogs' do
    let(:user) { User.find_by_id(3) }
    let(:api_key) { 'Bearer ' + Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first }
    let(:id) { user.id }

    context '200' do
      example_request 'GET - All dogs from user' do
        expect(status).to eq 200

        resp = JSON.parse(response_body)
        expect(resp.length).to eq 2
        expect(resp.first).to include(
          'name' => 'Lola',
          'age' => 2
        )
      end
    end
  end

  get '/pet-owner/:id/dog-walkings' do
    let(:user) { User.find_by_id(3) }
    let(:api_key) { 'Bearer ' + Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first }
    let(:id) { user.id }

    context '200' do
      example_request 'GET - All dog walkings from pet owner' do
        expect(status).to eq 200

        resp = JSON.parse(response_body)
        expect(resp.length).to eq 8
        expect(resp.first).to include(
          'duration' => 30,
          'latitude' => '-23.534296',
          'longitude' => '-46.724113',
          'begin_date' => '2019-11-09T16:32:00.000Z',
          'end_date' => '2019-11-09T17:01:00.000Z',
          'scheduled_date' => '2019-11-09T16:30:00.000Z',
          'price' => 40.0,
          'user_id' => 1,
          'dog_walking_status_id' => 4
        )
      end
    end
  end

  get '/walker/:id/dog-walkings' do
    let(:user) { User.find_by_id(1) }
    let(:api_key) { 'Bearer ' + Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first }
    let(:id) { user.id }

    context '200' do
      example_request 'GET - All dog walkings from walker' do
        expect(status).to eq 200

        resp = JSON.parse(response_body)
        expect(resp.length).to eq 3
        expect(resp.first).to include(
          'duration' => 30,
          'latitude' => '-23.534296',
          'longitude' => '-46.724113',
          'begin_date' => '2019-11-09T16:32:00.000Z',
          'end_date' => '2019-11-09T17:01:00.000Z',
          'scheduled_date' => '2019-11-09T16:30:00.000Z',
          'price' => 40.0,
          'user_id' => 1,
          'dog_walking_status_id' => 4
        )
      end
    end
  end
end