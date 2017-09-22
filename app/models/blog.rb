# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  avatar      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Blog < ApplicationRecord


    def self.blog_info_from_api(blog)
     
     client = Tumblr::Client.new :consumer_key => 'SC33bEI1MgbSTpMgI9ORph6mezAaTCm1uMYG81iOUNWJ4CMJ9f'
     blog_info = client.blog_info "#{blog.name}"
    
     blog_data = blog_info["blog"]
     set_blog = Blog.find_by_id(blog.id)
     
     
      set_blog.update({
          description: blog_data["description"],
          url: "#{blog.name}",
          name: blog_data["title"],
          avatar: "http://api.tumblr.com/v2/blog/#{blog.url}/avatar/512/"
      })
       set_blog
     
     
         
     
    end


end
# user.update({
#       token: params.credentials.token , 
#       name: params.info.name , 
#       image: params.info.image
#     })