# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  store_key  :string
#  name       :string
#  address    :string
#  chain_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
