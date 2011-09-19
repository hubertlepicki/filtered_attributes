require 'test_helper'

class BasicFiltersControllerTest < ActionController::TestCase
  test "should allow specified parameters" do
    post :create, user: { email: "foo@example.com", admin: true }
    assert passed_params[:email] == "foo@example.com"
  end

  test "should filter out not specified parameters" do
    post :create, user: { email: "foo@example.com", admin: true }
    assert !passed_params.keys.include?(:admin)
  end
end
