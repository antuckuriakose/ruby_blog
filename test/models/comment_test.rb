require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not save without commentor and  body" do
     comment =  Comment.new
	 assert_not comment.save, "saved without commentor and body"
   end
   test "should not save without commenter name" do
     comment = Comment.new
     comment.body = "Testing"
     assert_not comment.save, "saved without commenter name "
  end
  test "should not save without comment body" do
  	comment  = Comment.new
  	comment.commenter = "Testing"
  	assert_not comment.save, "saved without comment body"
  end
  test "should save comment having commenter and body" do
    comment = Comment.new
    comment.commenter = "Testing"
    comment.body = "Testing"
    assert comment.save, "saved the comment having commenter and body"
  end
   # test "the truth" do
  #   assert true
  # end
end

