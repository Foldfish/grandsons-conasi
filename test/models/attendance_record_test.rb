# == Schema Information
#
# Table name: attendance_records
#
#  id                   :integer          not null, primary key
#  start_of_week        :date
#  monday_store_id      :integer
#  tuesday_store_id     :integer
#  wednesday_store_id   :integer
#  thursday_store_id    :integer
#  friday_store_id      :integer
#  saturday_store_id    :integer
#  sunday_store_id      :integer
#  demo_staff_member_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class AttendanceRecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
