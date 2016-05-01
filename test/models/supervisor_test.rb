# == Schema Information
#
# Table name: supervisors
#
#  id         :integer          not null, primary key
#  name       :string
#  phone      :string
#  RFC        :string
#  store_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SupervisorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
