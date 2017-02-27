require 'rails_helper'

describe Api::V1::ChaptersController do
  let(:organization) { create(:organization, name: 'SpaceBridge') }
  let(:user) { create(:user, admin: true) }

  before do
    sign_in user
  end

  def response_body
    JSON.parse(response.body)
  end

  describe '#index' do
    let!(:chapter) { create(:chapter) }

    it 'returns all the chapters' do
      expected_response_body = {
        "data" => [
          {
            "id"=> chapter.id.to_s,
            "type"=> "chapters",
            "attributes" => {
              "organization-id"=> chapter.organization_id,
              "name"=> chapter.name,
              "website-url"=> chapter.website_url,
              "mailing-list-url"=> chapter.mailing_list_url,
              "twitter-handle"=> chapter.twitter_handle,
            }
          }
        ]
      }

      get :index

      expect(response.status).to eq(200)
      expect(response_body).to eq(expected_response_body)
    end
  end
end

