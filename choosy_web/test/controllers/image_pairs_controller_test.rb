require 'test_helper'

class ImagePairsControllerTest < ActionController::TestCase
  setup do
    @image_pair = image_pairs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_pairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_pair" do
    assert_difference('ImagePair.count') do
      post :create, image_pair: { user_id: @image_pair.user_id, votes_first: @image_pair.votes_first, votes_second: @image_pair.votes_second }
    end

    assert_redirected_to image_pair_path(assigns(:image_pair))
  end

  test "should show image_pair" do
    get :show, id: @image_pair
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_pair
    assert_response :success
  end

  test "should update image_pair" do
    patch :update, id: @image_pair, image_pair: { user_id: @image_pair.user_id, votes_first: @image_pair.votes_first, votes_second: @image_pair.votes_second }
    assert_redirected_to image_pair_path(assigns(:image_pair))
  end

  test "should destroy image_pair" do
    assert_difference('ImagePair.count', -1) do
      delete :destroy, id: @image_pair
    end

    assert_redirected_to image_pairs_path
  end
end
