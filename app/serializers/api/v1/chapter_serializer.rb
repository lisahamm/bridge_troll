class Api::V1::ChapterSerializer < ActiveModel::Serializer
  attributes :id, :organization_id, :name, :website_url, :mailing_list_url, :twitter_handle

end
