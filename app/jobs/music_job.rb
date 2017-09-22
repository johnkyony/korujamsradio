class MusicJob
  include SuckerPunch::Job

  def perform(blog)
    # ActiveRecord::Base.connection_pool.with_connection do
    #   Music.save_data_from_api(blog)
    # end
    
  end
end
