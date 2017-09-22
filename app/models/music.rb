# == Schema Information
#
# Table name: musics
#
#  id         :integer          not null, primary key
#  blog_id    :integer
#  uuid       :string
#  title      :string
#  artwork    :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Music < ApplicationRecord
  belongs_to :blog

  def self.save_data_from_api(blog)
    offset = 0
    client = Tumblr::Client.new :consumer_key => 'SC33bEI1MgbSTpMgI9ORph6mezAaTCm1uMYG81iOUNWJ4CMJ9f'
    iresult = client.posts "#{blog.name}", :type => 'audio', :filter => 'raw'
    total_post = iresult["total_posts"]/20
    total_post.times do |i|

      result = client.posts "#{blog.name}", :type => 'audio', :filter => 'raw',:offset => offset += 20
      feed_data = result["posts"]
      total_post = result["total_posts"]/20
      songs = feed_data.map do |post|
        song = Music.new
 
        song.blog_id = blog.id

        song.uuid = post["id"]
        song.artwork = post["album_art"]
        if post["album_art"].blank?
          song.url = post["source_url"]
        else
          song.url = post["audio_url"]
        end
        if post["song_name"].blank?
          song.title =  post["summary"]
        else
          song.title = post["song_name"]
        end
        # set name value however you want to do that
        song.save
        song
      end 
    
    end 

  end






  def self.update_data_from_api

    client = Tumblr::Client.new :consumer_key => 'SC33bEI1MgbSTpMgI9ORph6mezAaTCm1uMYG81iOUNWJ4CMJ9f'
    result = client.posts 'thedigitaltraphouse2.tumblr.com', :type => 'audio', :filter => 'raw'
    feed_data = result["posts"]
    total_post = result["total_posts"]/20
    songs = feed_data.map do |post|
      song = Music.new
      song.uuid = post["id"]
      song.artwork = post["album_art"]
      if post["album_art"].blank?
        song.url = post["source_url"]
      else
        song.url = post["audio_url"]
      end
      if post["song_name"].blank?
        song.title =  post["summary"]
      else
        song.title = post["song_name"]
      end
      # set name value however you want to do that
      song.save
      song
    end     
  end

end
