class BlogsJob
  include SuckerPunch::Job

  def perform(blog)
    ActiveRecord::Base.connection_pool.with_connection do
       Blog.blog_info_from_api(blog)
       Music.save_data_from_api(blog)
       
    end
   
  end
end
