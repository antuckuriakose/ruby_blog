require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
 
  # test "the truth" do
  #   assert true
  # end
 test "should not save article without title and text" do
   article = Article.new
   assert_not article.save, "saved article without title and text "
 end
 test "should not save article without title" do
 	article = Article.new
 	article.text ="Testing"
 	assert_not article.save, "saved article  without title"
 end
 test "should not save article without body" do
 	article = Article.new
 	article.title = "Testing"
 	assert_not article.save, "saved  article without body"
 end
 test "should save article having title and body" do
 	article = Article.new
 	article.title = "Testing"
 	article.text = "Testing"
 	assert article.save, "should not save  article having title and body"
 end

end
