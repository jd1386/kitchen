require 'test_helper'

class IngredientControllerTest < ActionController::TestCase
  test "should get recipe:reference" do
    get :recipe:reference
    assert_response :success
  end

  test "should get food_item:reference" do
    get :food_item:reference
    assert_response :success
  end

  test "should get volume:string" do
    get :volume:string
    assert_response :success
  end

end
