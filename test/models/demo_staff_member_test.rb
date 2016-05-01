# == Schema Information
#
# Table name: demo_staff_members
#
#  id         :integer          not null, primary key
#  name       :string
#  phone      :string
#  RFC        :string
#  CURP       :string
#  NSS        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DemoStaffMemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
