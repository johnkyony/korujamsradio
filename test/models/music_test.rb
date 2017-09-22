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

require 'test_helper'

class MusicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
