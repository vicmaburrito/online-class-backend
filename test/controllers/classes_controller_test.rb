require 'test_helper'

class ClassesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get classes_index_url
    assert_response :success
  end

  test 'should get show' do
    get classes_show_url
    assert_response :success
  end

  test 'should get new' do
    get classes_new_url
    assert_response :success
  end

  test 'should get edit' do
    get classes_edit_url
    assert_response :success
  end

  test 'should get create' do
    get classes_create_url
    assert_response :success
  end

  test 'should get update' do
    get classes_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get classes_destroy_url
    assert_response :success
  end
end
