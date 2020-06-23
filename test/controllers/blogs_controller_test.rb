require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  # teardown do
  #   Rails.cache.clear
  # end

  test "should get show" do
    get blog_url(blogs(:one))
    assert_response :success
  end

  test "create blogs success test" do
    get new_blog_url
    assert_response :success
    assert_difference "Blog.count", 1 do
      post blogs_path, params: {
        blog: {
          user_id: 1,
          title: "like fruites",
          body: "is mikann!!!!"
        }
      }
    end

    follow_redirect!
    assert_response :success
  end

  test "failed test " do
    get new_blog_url
    assert_response :success
    assert_no_difference "Blog.count" do
      post blogs_path, params: {
        blog: {
          user_id: 1,
          title: "",
          body: "title is empty!"
        }
      }
    end
    assert_select "div", "たいとるが空です"
  end

end
