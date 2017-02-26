class AddDetailsToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :twitter_handle, :string
    add_column :chapters, :website_url, :string
    add_column :chapters, :mailing_list_url, :string
  end
end
