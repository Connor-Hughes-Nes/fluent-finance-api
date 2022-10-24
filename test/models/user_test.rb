# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  user_id    :string
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  first_name :string
#  last_name  :string
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
