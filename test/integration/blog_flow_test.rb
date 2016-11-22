require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest
  test "can see the article index page" do
    get "/"
    assert_select "h1", "Listing articles"
  end

  test "attempt to register with invalid details" do
    get "/users/sign_up"
    assert_response :success

    post_via_redirect "/users", user: {email: "", name: "", password: "", password_confirmation: ""}
    assert_equal "/users", path
    assert_response 200
  end

  test "attempt to register with existing user" do
    user = User.first()
    get "/users/sign_up"
    assert_response :success

    post_via_redirect "/users", user: {email: user.email, name: user.name, password: "123456", password_confirmation: "123456"}
    assert_equal "/users", path
    assert_response 200
  end

  test "attempt to register with new user" do
    get "/users/sign_up"
    assert_response :success

    post_via_redirect "/users", user: {email: "ab@a.com", name: 'abcd', password: "123456", password_confirmation: "123456"}
    assert_equal "/", path
    assert_response 200
  end

  test "attempt to login with invalid user" do
    get "/users/sign_in"
    assert_response :success

    post_via_redirect "/users/sign_in", user: {email: "", password: ""}
    assert_equal "/users/sign_in", path
    assert_response 200
  end

  test "attempt to login with valid user" do
    get "/users/sign_in"
    assert_response :success

    sign_in users(:bob)
    assert_equal "/users/sign_in", path
    assert_response 200
  end
  test "attempt to create an article without signing in" do
    get "/articles/new"
    assert_response 302
  end

  # test "can create an article with valid user" do
  #   get "/articles/new"
  #   assert_response 302
  #
  #   post "/users/sign_in",params: { user: {email: "ab@a.com", password: "123456"} }
  #   # assert_response :redirect
  #   # follow_redirect!
  #   assert_response :success
  #   follow_redirect!
  #   post "/articles",params: { article: { title: "can create", text: "article successfully." } }
  #   assert_response :redirect
  #   follow_redirect!
  #   assert_response :success
  #   assert_select "h1", "can create"
  # end
end
