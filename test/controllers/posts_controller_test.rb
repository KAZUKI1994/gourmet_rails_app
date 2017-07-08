require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: { amount: @post.amount, atomos_eval: @post.atomos_eval, content: @post.content, drink_eval: @post.drink_eval, partner_eval: @post.partner_eval, quality_eval: @post.quality_eval, restaurant_id: @post.restaurant_id, service_eval: @post.service_eval, time_zone: @post.time_zone, titile: @post.titile, total_eval: @post.total_eval, url: @post.url, user_id: @post.user_id, visit_date: @post.visit_date }
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do
    patch :update, id: @post, post: { amount: @post.amount, atomos_eval: @post.atomos_eval, content: @post.content, drink_eval: @post.drink_eval, partner_eval: @post.partner_eval, quality_eval: @post.quality_eval, restaurant_id: @post.restaurant_id, service_eval: @post.service_eval, time_zone: @post.time_zone, titile: @post.titile, total_eval: @post.total_eval, url: @post.url, user_id: @post.user_id, visit_date: @post.visit_date }
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end

    assert_redirected_to posts_path
  end
end
