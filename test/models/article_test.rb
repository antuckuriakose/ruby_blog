require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save article without title and text" do
    article = Article.new
    assert_not article.save, "saved article without title and text"
  end

  test "should not save article without text" do
    article = Article.new
    article.title = "Testing"
    assert_not article.save, "saved article without text"
  end

  test "should not save article without title" do
    article = Article.new
    article.text = "Testing"
    assert_not article.save, "saved article without title"
  end

  test "should not save article without sufficient char" do
    article = Article.new
    article.text = "Test"
    article.title = "Test"
    assert_not article.save, "saved article without sufficient char"
  end

  test "should save article" do
    article = Article.new
    article.title = "Testing"
    article.text = "Testing"
    assert article.save, "saved"
  end

end
