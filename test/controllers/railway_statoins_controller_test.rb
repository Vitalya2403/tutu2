require 'test_helper'

class RailwayStatoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @railway_statoin = railway_statoins(:one)
  end

  test "should get index" do
    get railway_statoins_url
    assert_response :success
  end

  test "should get new" do
    get new_railway_statoin_url
    assert_response :success
  end

  test "should create railway_statoin" do
    assert_difference('RailwayStatoin.count') do
      post railway_statoins_url, params: { railway_statoin: { title: @railway_statoin.title } }
    end

    assert_redirected_to railway_statoin_url(RailwayStatoin.last)
  end

  test "should show railway_statoin" do
    get railway_statoin_url(@railway_statoin)
    assert_response :success
  end

  test "should get edit" do
    get edit_railway_statoin_url(@railway_statoin)
    assert_response :success
  end

  test "should update railway_statoin" do
    patch railway_statoin_url(@railway_statoin), params: { railway_statoin: { title: @railway_statoin.title } }
    assert_redirected_to railway_statoin_url(@railway_statoin)
  end

  test "should destroy railway_statoin" do
    assert_difference('RailwayStatoin.count', -1) do
      delete railway_statoin_url(@railway_statoin)
    end

    assert_redirected_to railway_statoins_url
  end
end
