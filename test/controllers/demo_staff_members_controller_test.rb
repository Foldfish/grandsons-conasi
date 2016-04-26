require 'test_helper'

class DemoStaffMembersControllerTest < ActionController::TestCase
  setup do
    @demo_staff_member = demo_staff_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:demo_staff_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create demo_staff_member" do
    assert_difference('DemoStaffMember.count') do
      post :create, demo_staff_member: { CURP: @demo_staff_member.CURP, NSS: @demo_staff_member.NSS, RFC: @demo_staff_member.RFC, name: @demo_staff_member.name, phone: @demo_staff_member.phone }
    end

    assert_redirected_to demo_staff_member_path(assigns(:demo_staff_member))
  end

  test "should show demo_staff_member" do
    get :show, id: @demo_staff_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @demo_staff_member
    assert_response :success
  end

  test "should update demo_staff_member" do
    patch :update, id: @demo_staff_member, demo_staff_member: { CURP: @demo_staff_member.CURP, NSS: @demo_staff_member.NSS, RFC: @demo_staff_member.RFC, name: @demo_staff_member.name, phone: @demo_staff_member.phone }
    assert_redirected_to demo_staff_member_path(assigns(:demo_staff_member))
  end

  test "should destroy demo_staff_member" do
    assert_difference('DemoStaffMember.count', -1) do
      delete :destroy, id: @demo_staff_member
    end

    assert_redirected_to demo_staff_members_path
  end
end
