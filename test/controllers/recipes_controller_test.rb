require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index,' do
    get recipes_index, _url
    assert_response :success
  end

  test 'should get show,' do
    get recipes_show, _url
    assert_response :success
  end

  test 'should get new,' do
    get recipes_new, _url
    assert_response :success
  end

  test 'should get destroy' do
    get recipes_destroy_url
    assert_response :success
  end
end
