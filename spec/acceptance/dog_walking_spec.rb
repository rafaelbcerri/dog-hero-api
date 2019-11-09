require 'support/acceptance_helper'

resource 'Dog Walking' do

  authentication :basic, :api_key
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  let(:user) { User.find_by_id(3) }
  let(:api_key) { 'Bearer ' + Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first }

  get 'dog-walkings' do
    parameter :all, 'return all types of dog walkings', :required => false
    parameter :page, 'page', :required => true
    parameter :per_page, 'per_page', :required => true

    context '200' do
      let(:all) { true }
      let(:page) { 1 }
      let(:per_page) { 5 }

      example_request 'GET - List of dog walkings' do
        expect(status).to eq 200

        resp = JSON.parse(response_body)
        expect(resp.length).to eq 5
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

  post 'dog-walkings' do
    parameter :duration, 'duration', :required => true
    parameter :latitude, 'latitude', :required => true
    parameter :longitude, 'longitude', :required => true
    parameter :scheduled_date, 'scheduled_date', :required => true
    parameter :dogs, 'dogs', :required => true

    context '201' do
      let(:duration) { 30 }
      let(:latitude) { '-23.524962' }
      let(:longitude) { '-46.731325' }
      let(:scheduled_date) { 'Mon Nov 11 2019 16:30:00' }
      let(:dogs) { [1] }
      let(:raw_post) { params.to_json }

      example_request 'POST - Create new dog walking' do
        expect(status).to eq 201

        resp = JSON.parse(response_body)
        expect(resp).to include(
          'duration' => 30,
          'latitude' => '-23.524962',
          'longitude' => '-46.731325',
          'begin_date' => nil,
          'end_date' => nil,
          'scheduled_date' => '2019-11-11T16:30:00.000Z',
          'price' => 25.0,
          'user_id' => nil,
          'dog_walking_status_id' => 1
        )
      end
    end
  end

  get 'dog-walkings/:id' do
    context '200' do
      let(:id) { 1 }

      example_request 'GET - Dog walking by id' do
        expect(status).to eq 200

        resp = JSON.parse(response_body)
        expect(resp).to include(
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

  put 'dog-walkings/:id' do
    parameter :walker_id, 'walker_id', :required => true

    context '200' do
      let(:id) { 10 }
      let(:walker_id) { '1' }
      let(:raw_post) { params.to_json }

      example_request 'PUT - Update walker id' do
        expect(status).to eq 200

        resp = JSON.parse(response_body)
        expect(resp).to include('user_id' => 1)
      end
    end
  end

  delete 'dog-walkings/:id' do
    context '204' do
      let(:id) { 10 }

      example_request 'DELETE - Remove dog walking' do
        expect(status).to eq 204
      end
    end
  end

  post 'dog-walkings/:id/start-walk' do
    before do
      Timecop.freeze(Time.now)
    end

    context '200' do
      let(:id) { 10 }

      example_request 'POST - Add begin_date to dog walking' do
        expect(status).to eq 200

        resp = JSON.parse(response_body)
        expect(Time.parse(resp['begin_date']).to_s(:short))
          .to eq(Time.now.to_s(:short) )
      end
    end

    after do
      Timecop.return
    end
  end

  post 'dog-walkings/:id/finish-walk' do
    before do
      Timecop.freeze(Time.now)
    end

    context '200' do
      let(:id) { 10 }

      example_request 'POST - Add end_date to dog walking' do
        expect(status).to eq 200

        resp = JSON.parse(response_body)
        expect(Time.parse(resp['end_date']).to_s(:short))
          .to eq(Time.now.to_s(:short) )
      end
    end

    after do
      Timecop.return
    end
  end
end