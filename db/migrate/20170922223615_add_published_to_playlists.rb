class AddPublishedToPlaylists < ActiveRecord::Migration[5.1]
  def change
    add_column :playlists, :published, :boolean
  end
end
