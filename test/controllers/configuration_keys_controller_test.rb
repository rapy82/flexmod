require 'test_helper'

class ConfigurationKeysControllerTest < ActionController::TestCase
  setup do
    @configuration_key = configuration_keys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:configuration_keys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create configuration_key" do
    assert_difference('ConfigurationKey.count') do
      post :create, configuration_key: { description: @configuration_key.description, key: @configuration_key.key, section: @configuration_key.section, value: @configuration_key.value }
    end

    assert_redirected_to configuration_key_path(assigns(:configuration_key))
  end

  test "should show configuration_key" do
    get :show, id: @configuration_key
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @configuration_key
    assert_response :success
  end

  test "should update configuration_key" do
    patch :update, id: @configuration_key, configuration_key: { description: @configuration_key.description, key: @configuration_key.key, section: @configuration_key.section, value: @configuration_key.value }
    assert_redirected_to configuration_key_path(assigns(:configuration_key))
  end

  test "should destroy configuration_key" do
    assert_difference('ConfigurationKey.count', -1) do
      delete :destroy, id: @configuration_key
    end

    assert_redirected_to configuration_keys_path
  end
end
